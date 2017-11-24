<footer>
	<div class="contenedor">
		<div class="col-40 tablet-col-100 movil-col-100 alinearCentro">
			<img src="img/varios/logo.png" class="logoPie" />
			<br />
		</div>
		<div class="col-60 tablet-col-100 movil-col-100">
			<?php
			if (isset($_SESSION["DNI"])) {
				crearMenu($menuBoton_on, 1, $_SESSION["DNI"]);
			} else {
				crearMenu($menuBoton_on, 1);
			}
			?>
		</div>
	</div>
</footer>
<div class="clear"></div>
	
