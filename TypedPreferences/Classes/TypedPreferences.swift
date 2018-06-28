
import Foundation

/// 'dynamic' is required for every property.
/// Serializable properties should be @objc-compatible.
/// See property declarations below.
final class ExamplePreferences: TypedPreferences {
	
	/// 'String?' optional is valid @objc property because it can be bridged to 'NSString' or 'nil' value.
	dynamic var userName: String?
	
	/// 'Int?' is optional and is not a valid @objc property (consider 'NSNumber?').
	/// Optional (NSInteger?) is not possible in @objc.
//	dynamic var someCounter: Int?
	
	/// Non-optional 'Int' is valid in @objc.
	dynamic var counter: Int
	
	override init() {
		// Non-optional has to be initialized with default value before 'super.init()'.
		counter = 0
		
		// Calling 'super.init()' after all props initialized with default values.
		// 'super.init()' loads and resets every property with updated value if such value exists in UserDefaults storage container.
		super.init()
	}
	
}

@objcMembers
open class TypedPreferences: NSObject {
	
	deinit {
		stopObservingPropertyChanges()
	}
	
	override public init() {
		super.init()
		
		loadPropertyNames()
		startObservingPropertyChanges()
	}
	
	open func synchronize() {
		userDefaults.synchronize()
	}
	
	private var propertyNames: Set<String> = []
	private let userDefaults = UserDefaults.standard
	
	// MARK: -
	
	private func loadPropertyNames() {
		for property in Mirror(reflecting: self).children {
			guard let name = property.label else {
				continue
			}
			
			propertyNames.insert(name)
		}
	}
	
	private func startObservingPropertyChanges() {
		for property in propertyNames {
			if let existingValue = userDefaults.object(forKey: property) {
				setValue(existingValue, forKey: property)
			}
			
			addObserver(self, forKeyPath: property, options: [.new], context: nil)
		}
	}
	
	private func stopObservingPropertyChanges() {
		for property in propertyNames {
			removeObserver(self, forKeyPath: property)
		}
	}
	
	open override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey: Any]?, context: UnsafeMutableRawPointer?) {
		var found = false
		
		for key in propertyNames {
			if key == keyPath {
				var valueToSet: Any?
				
				if let newValue = change?[.newKey] {
					if type(of: newValue) != NSNull.self {
						valueToSet = newValue
					}
				}
				
				if let validValue = valueToSet {
					userDefaults.set(validValue, forKey: key)
				} else {
					userDefaults.removeObject(forKey: key)
				}
				
				found = true
				break
			}
		}
		
		if found == false {
			super.observeValue(forKeyPath: keyPath, of: object, change: change, context: context)
		}
	}
	
}
