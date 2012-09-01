<?php
class Sys_Content_Tpl extends Sys_Singleton{

	var $variables = array( );
	var $tpl_dir = null;
        
        public function __construct() {
            $tplConfig = Sys_Config::getInstance()->getClassConfigAttr(__CLASS__);
            $this->tpl_dir=$tplConfig['destination'];
            define( "TPL_CACHE_ENABLED", $tplConfig['enableCache'] );
            define( "TPL_EXT", $tplConfig['templateExtension'] );
            define( "IN_RAINTPL", $tplConfig['inTpl'] );
        }

	function RainTPL( $tpl_dir = null ){

		if( $tpl_dir )
			$this->tpl_dir = $GLOBALS[ 'RainTPL_tpl_dir' ] = $tpl_dir . ( substr($tpl_dir,-1,1) != "/" ? "/" : "" );
		elseif( isset( $GLOBALS[ 'RainTPL_tpl_dir' ] ) )
			$this->tpl_dir = $GLOBALS[ 'RainTPL_tpl_dir' ];

	}

	function assign( $variable, $value = null ){

		if( is_array( $variable ) )
			foreach( $variable as $name => $value )
				$this->variables[ $name ] = $value;
		elseif( is_object( $variable ) ){
			$variable = get_object_vars( $variable );
			foreach( $variable as $name => $value )
				$this->variables[ $name ] = $value;
		}
		else
			$this->variables[ $variable ] = $value;
	}

	function draw( $tpl_name, $return_string = false ){

		if( count( $a = explode('/', $tpl_name) ) > 1 ){
			$temp = $tpl_name;
			$tpl_name = end( $a );
			$tpl_dir = substr( $temp, 0, strlen($temp) - strlen( $tpl_name ) );
		}
		else
			$tpl_dir = null;

		//var is the variabile che si trova in ogni template
		$var = $this->variables;

		if( !file_exists( $template_file = $this->tpl_dir . $tpl_dir . $tpl_name . '.' . TPL_EXT ) ){
                    throw new Sys_Content_Exception('template file not found:'. $template_file = $this->tpl_dir . $tpl_dir . $tpl_name . '.' . TPL_EXT , 14, true);
		}
		elseif( !is_writable( $this->tpl_dir ) )
			$compiled_filename = $this->tpl_dir . $tpl_dir . "/compiled/" . $tpl_name . "_def.php";
		elseif( TPL_CACHE_ENABLED && file_exists( $this->tpl_dir . $tpl_dir . "/compiled/" . $tpl_name . "_" . ( $filetime = filemtime( $template_file ) ) . ".php" ) )
			$compiled_filename = $this->tpl_dir . $tpl_dir . "/compiled/" . $tpl_name . "_" . $filetime . ".php";
		else{
			$RainTPLCompile_obj = new Sys_Content_Template_Core();
			$RainTPLCompile_obj->compileFile( $tpl_name, $this->tpl_dir . $tpl_dir );
			// template last update date
			$filetime = filemtime( $this->tpl_dir . $tpl_dir . '/' . $tpl_name . '.' . TPL_EXT );
			$compiled_filename = $this->tpl_dir . $tpl_dir . "/compiled/" . $tpl_name . "_" . $filetime . ".php";
		}

		//if return_string is true, the function return the output as a  string
		if( $return_string ){
			ob_start();
			include( $compiled_filename );
			$contents = ob_get_contents();
			ob_end_clean();
			return $contents;
		}
		else {
			include( $compiled_filename );
                }
	}


}



?>