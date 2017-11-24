<script>
$(document).ready(function() {
	desplegableMenu();
});
</script>

<menu class="col-100 tablet-col-100 movil-col-100 noPadding">
	<?php
	if (isset($_SESSION["DNI"])) {
		crearMenu($menuBoton_on, 0, $_SESSION["DNI"]);
	} else {
		crearMenu($menuBoton_on, 0);
	}
	?>
</menu>
<div class="clear"></div>