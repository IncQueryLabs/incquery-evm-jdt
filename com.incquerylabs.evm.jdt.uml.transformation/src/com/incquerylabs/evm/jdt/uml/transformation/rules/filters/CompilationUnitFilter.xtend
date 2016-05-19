package com.incquerylabs.evm.jdt.uml.transformation.rules.filters

import com.incquerylabs.evm.jdt.CompositeEventFilter
import com.incquerylabs.evm.jdt.JDTEventAtom
import org.eclipse.viatra.transformation.evm.api.event.EventFilter
import org.eclipse.jdt.core.ICompilationUnit

class CompilationUnitFilter extends CompositeEventFilter<JDTEventAtom> {
	
	new(EventFilter<JDTEventAtom> filter) {
		super(filter)
	}
	
	override isCompositeProcessable(JDTEventAtom eventAtom) {
		val javaElement = eventAtom.element
		return javaElement instanceof ICompilationUnit
	}
	
}