/*
 * generated by Xtext
 */
package org.processus.ecleek.validation

import org.eclipse.emf.ecore.EClass
import org.eclipse.emf.ecore.EObject
import org.eclipse.xtext.validation.Check
import org.processus.ecleek.leek.BreakStatement
import org.processus.ecleek.leek.ContinueStatement
import org.processus.ecleek.leek.FunctionDeclaration
import org.processus.ecleek.leek.GlobalDeclaration
import org.processus.ecleek.leek.Include
import org.processus.ecleek.leek.LeekPackage
import org.processus.ecleek.leek.ReturnStatement

/**
 * Custom validation rules. 
 *
 * see http://www.eclipse.org/Xtext/documentation.html#validation
 */
class LeekValidator extends AbstractLeekValidator {

	public static val RETURN_STATEMENT_IS_IN_FUNCTION_DECLARATION = 'ReturnStatementIsInFunctionDeclaration'

	public static val BREAK_STATEMENT_IS_IN_LOOP = 'BreakStatementIsInLoop'

	public static val CONTINUE_STATEMENT_IS_IN_LOOP = 'ContinueStatementIsInLoop'

	public static val INCLUDE_IS_IN_SCRIPT = 'IncludeIsInScript'

	public static val GLOBAL_DECLARATION_IS_IN_SCRIPT = 'GlobalDeclarationIsInScript'

	public static val FUNCTION_DECLARATION_IS_IN_SCRIPT = 'FunctionDeclarationIsInScript'

	@Check
	def checkReturnStatementIsInFunctionDeclaration(ReturnStatement returnStatement) {
		if (!hasContainer(returnStatement, LeekPackage.eINSTANCE.functionDeclaration)) {
			error('ReturnStatement must be in a FunctionDeclaration', null, RETURN_STATEMENT_IS_IN_FUNCTION_DECLARATION);
		}
	}

	@Check
	def checkBreakStatementIsInLoop(BreakStatement breakStatement) {
		if (!hasContainer(breakStatement, LeekPackage.eINSTANCE.^while) &&
			!hasContainer(breakStatement, LeekPackage.eINSTANCE.^for) &&
			!hasContainer(breakStatement, LeekPackage.eINSTANCE.^forIn) 
		) {
			error('BreakStatement must be in a For or a While', null, BREAK_STATEMENT_IS_IN_LOOP);
		}
	}

	@Check
	def checkContinueStatementIsInLoop(ContinueStatement continueStatement) {
		if (!hasContainer(continueStatement, LeekPackage.eINSTANCE.^while) &&
			!hasContainer(continueStatement, LeekPackage.eINSTANCE.^for) &&
			!hasContainer(continueStatement, LeekPackage.eINSTANCE.^forIn)
		) {
			error('ContinueStatement must be in a For or a While', null, CONTINUE_STATEMENT_IS_IN_LOOP);
		}
	}

	@Check
	def checkIncludeIsInScript(Include include) {
		if (include.eContainer == null || !include.eContainer.eClass.equals(LeekPackage.eINSTANCE.script)) {
			error('Include must be at Script top level.', null, INCLUDE_IS_IN_SCRIPT);
		}
	}

	@Check
	def checkGlobalDeclarationIsInScript(GlobalDeclaration global) {
		if (global.eContainer == null || !global.eContainer.eClass.equals(LeekPackage.eINSTANCE.script)) {
			error('GlobalDeclaration must be at Script top level.', null, GLOBAL_DECLARATION_IS_IN_SCRIPT);
		}
	}

	@Check
	def checkFunctionDeclarationIsInScript(FunctionDeclaration function) {
		if (function.eContainer == null || !function.eContainer.eClass.equals(LeekPackage.eINSTANCE.script)) {
			error('FunctionDeclaration must be at Script top level.', null, FUNCTION_DECLARATION_IS_IN_SCRIPT);
		}
	}

	def boolean hasContainer(EObject eObj, EClass eCls) {
		return eCls.isSuperTypeOf(eObj.eClass) || (eObj.eContainer != null && hasContainer(eObj.eContainer, eCls));
	}
}
