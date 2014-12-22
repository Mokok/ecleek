/**
 */
package org.processus.ecleek.leek;


/**
 * <!-- begin-user-doc -->
 * A representation of the model object '<em><b>Parameter Declaration</b></em>'.
 * <!-- end-user-doc -->
 *
 * <p>
 * The following features are supported:
 * <ul>
 *   <li>{@link org.processus.ecleek.leek.ParameterDeclaration#isByAdress <em>By Adress</em>}</li>
 * </ul>
 * </p>
 *
 * @see org.processus.ecleek.leek.LeekPackage#getParameterDeclaration()
 * @model
 * @generated
 */
public interface ParameterDeclaration extends VariableReferenceable
{
  /**
   * Returns the value of the '<em><b>By Adress</b></em>' attribute.
   * <!-- begin-user-doc -->
   * <p>
   * If the meaning of the '<em>By Adress</em>' attribute isn't clear,
   * there really should be more of a description here...
   * </p>
   * <!-- end-user-doc -->
   * @return the value of the '<em>By Adress</em>' attribute.
   * @see #setByAdress(boolean)
   * @see org.processus.ecleek.leek.LeekPackage#getParameterDeclaration_ByAdress()
   * @model
   * @generated
   */
  boolean isByAdress();

  /**
   * Sets the value of the '{@link org.processus.ecleek.leek.ParameterDeclaration#isByAdress <em>By Adress</em>}' attribute.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @param value the new value of the '<em>By Adress</em>' attribute.
   * @see #isByAdress()
   * @generated
   */
  void setByAdress(boolean value);

} // ParameterDeclaration
