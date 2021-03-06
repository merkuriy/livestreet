<?php
/**
 * LiveStreet CMS
 * Copyright © 2013 OOO "ЛС-СОФТ"
 *
 * ------------------------------------------------------
 *
 * Official site: www.livestreetcms.com
 * Contact e-mail: office@livestreetcms.com
 *
 * GNU General Public License, version 2:
 * http://www.gnu.org/licenses/old-licenses/gpl-2.0.html
 *
 * ------------------------------------------------------
 *
 * @link http://www.livestreetcms.com
 * @copyright 2013 OOO "ЛС-СОФТ"
 * @author Maxim Mzhelskiy <rus.engine@gmail.com>
 *
 */

class ModuleProperty_EntityValueTypeCheckbox extends ModuleProperty_EntityValueType {

	public function getValueForDisplay() {
		return (bool)$this->getValueObject()->getValueInt();
	}

	public function validate() {
		return $this->validateStandart('boolean');
	}

	public function setValue($mValue) {
		$this->resetAllValue();
		$oValue=$this->getValueObject();
		$oValue->setValueInt($mValue ? 1 : 0);
	}
}