//
//  ExampleStateMachine.swift
//  statemachine
//
//  Created by David G. Young on 8/15/22.
//

import Foundation
import StateMachine

class ExampleStateMachine: StateMachineBuilder {
    enum State: StateMachineHashable {
        case solid, liquid, gas
    }

    enum Event: StateMachineHashable {
        case melt, freeze, vaporize, condense
    }

    enum SideEffect {
        case logMelted, logFrozen, logVaporized, logCondensed
    }
    let stateMachine = StateMachine<State, Event, SideEffect> {
        initialState(.solid)
        state(.solid) {
            on(.melt) {
                transition(to: .liquid, emit: .logMelted)
            }
        }
        state(.liquid) {
            on(.freeze) {
                transition(to: .solid, emit: .logFrozen)
            }
            on(.vaporize) {
                transition(to: .gas, emit: .logVaporized)
            }
        }
        state(.gas) {
            on(.condense) {
                transition(to: .liquid, emit: .logCondensed)
            }
        }
        onTransition {
            guard case let .success(transition) = $0, let sideEffect = transition.sideEffect else { return }
            switch sideEffect {
            case .logMelted: NSLog("melted")
            case .logFrozen: NSLog("frozen")
            case .logVaporized: NSLog("vaporized")
            case .logCondensed: NSLog("condensed")
            }
        }
    }
    func test() {
        NSLog("state should start with solid: \(stateMachine.state == .solid)")
        let transition = try? stateMachine.transition(ExampleStateMachine.Event.melt)
        NSLog("state should be liquid after melt: \(stateMachine.state == .liquid)")
        NSLog("side effect should be: \(String(describing: transition?.sideEffect))")
        let transition2 = try? stateMachine.transition(ExampleStateMachine.Event.melt)
        NSLog("state should be liquid after melt again: \(stateMachine.state == .liquid)")
        NSLog("side effect should be nil: \(String(describing: transition2?.sideEffect))")
    }
}


