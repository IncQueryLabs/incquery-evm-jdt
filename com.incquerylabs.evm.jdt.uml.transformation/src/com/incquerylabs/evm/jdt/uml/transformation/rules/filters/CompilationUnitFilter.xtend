package com.incquerylabs.evm.jdt.uml.transformation.rules.filters

import org.eclipse.jdt.core.ICompilationUnit
import org.eclipse.viatra.integration.evm.jdt.CompositeEventFilter
import org.eclipse.viatra.integration.evm.jdt.JDTEventAtom
import org.eclipse.viatra.transformation.evm.api.event.EventFilter

class CompilationUnitFilter extends CompositeEventFilter<JDTEventAtom> {
	
	new(EventFilter<JDTEventAtom> filter) {
		super(filter)
	}
	
	override isCompositeProcessable(JDTEventAtom eventAtom) {
		val javaElement = eventAtom.element
		return javaElement instanceof ICompilationUnit
	}
	
}