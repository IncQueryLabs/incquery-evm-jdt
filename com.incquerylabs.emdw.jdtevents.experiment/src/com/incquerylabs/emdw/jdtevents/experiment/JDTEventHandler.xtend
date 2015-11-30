package com.incquerylabs.emdw.jdtevents.experiment

import org.eclipse.incquery.runtime.evm.api.Activation
import org.eclipse.incquery.runtime.evm.api.RuleInstance
import org.eclipse.incquery.runtime.evm.api.event.Event
import org.eclipse.incquery.runtime.evm.api.event.EventFilter
import org.eclipse.incquery.runtime.evm.api.event.EventHandler
import org.eclipse.incquery.runtime.evm.api.event.EventSource
import org.eclipse.jdt.core.IJavaElementDelta

class JDTEventHandler implements EventHandler<IJavaElementDelta>{
	JDTEventFilter filter
	JDTEventSource source
	RuleInstance<IJavaElementDelta> instance
	override void handleEvent(Event<IJavaElementDelta> event) {
		var JDTEventType type=event.getEventType() as JDTEventType 
		var IJavaElementDelta eventAtom=event.getEventAtom() 
		
		switch (type) {
			case ELEMENT_CHANGED:{
				var Activation<IJavaElementDelta> activation=instance.createActivation(eventAtom) 
				instance.activationStateTransition(activation, type)
			}
			default :{
				System.err.println("Something bad happened")
			}
		}
	}
	override EventSource<IJavaElementDelta> getSource() {
		return source 
	}
	override EventFilter<? super IJavaElementDelta> getEventFilter() {
		return filter 
	}
	override void dispose() {
		
	}
	/** 
	 * @param source
	 * @param filter
	 * @param instance
	 */
	 new(JDTEventSource source, JDTEventFilter filter, RuleInstance<IJavaElementDelta> instance) {
		this.source=source this.filter=filter this.instance=instance 
	}
	
}