/*:
# 🔩 The Dependency Inversion Principle

Depend on abstractions, not on concretions. ([read more](http://docs.google.com/a/cleancoder.com/viewer?a=v&pid=explorer&chrome=true&srcid=0BwhCYaYDn8EgMjdlMWIzNGUtZTQ0NC00ZjQ5LTkwYzQtZjRhMDRlNTQ3ZGMz&hl=en))

Example:
*/

protocol TimeTraveling {
    func travelInTime(time: NSTimeInterval) -> String
}

final class DeLorean : TimeTraveling {
	func travelInTime(time: NSTimeInterval) -> String {
		return "Used Flux Capacitor and travelled in time by: \(time)s"
	}
}

final class EmmettBrown {
	private let timeMachine: TimeTraveling

	// ⚠️ NOTE: Emmet Brown is given the `DeLorean` as a `TimeTraveling` device, not the concreet class `DeLorean`.
	init(timeMachine: TimeTraveling) {
		self.timeMachine = timeMachine
	}

	func travelInTime(time: NSTimeInterval) -> String {
		return timeMachine.travelInTime(time)
	}
}

let timeMachine = DeLorean()

let mastermind = EmmettBrown(timeMachine: timeMachine)
mastermind.travelInTime(-3600 * 8760)