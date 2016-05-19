package com.incquerylabs.evm.jdt

import org.eclipse.viatra.transformation.evm.api.RuleInstance
import org.eclipse.viatra.transformation.evm.api.event.AbstractRuleInstanceBuilder
import org.eclipse.viatra.transformation.evm.api.event.EventFilter
import org.eclipse.viatra.transformation.evm.api.event.EventRealm
import org.eclipse.viatra.transformation.evm.api.event.EventSourceSpecification

class JDTEventSourceSpecification implements EventSourceSpecification<JDTEventAtom> {
	override EventFilter<JDTEventAtom> createEmptyFilter() {
		return new JDTEventFilter()
	}

	override AbstractRuleInstanceBuilder<JDTEventAtom> getRuleInstanceBuilder(EventRealm realm) {
		return ( [ RuleInstance<JDTEventAtom> ruleInstance, EventFilter<? super JDTEventAtom> filter |
			var JDTEventSource source = new JDTEventSource(JDTEventSourceSpecification.this, realm as JDTRealm)
			var JDTEventHandler handler = new JDTEventHandler(source, filter, ruleInstance)
			source.addHandler(handler)
			ruleInstance.handler = handler
		] as AbstractRuleInstanceBuilder<JDTEventAtom>)
	}

}
