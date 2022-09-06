<?php
/**
* @package Price Comparison Shopping Engine - UkrSolution for Joomla! 1.6, 1.7, 2x, 3.x* @version 1.0.1
* @author UkrSolution
* @copyright (C) 2015 - UkrSolution
* @license GNU/GPLv3 http://www.gnu.org/licenses/gpl-3.0.html
**/
 defined ('_JEXEC') or die; ?>

<?php	

	if ($this->block == null) {		
		
			echo '<iframe src="'.JURI::root().'/administrator/index.php?option=com_goodspack" style="display: none"></iframe>';

			echo 	'<script type="text/javascript">

					function locs(){ 
					location.reload(true); 
					}

					setTimeout("locs()", 3000); 

					</script>';
		}		

	echo htmlspecialchars_decode($this->block);
?>