<?php


/**
 * Project: RainTPL, compile HTML template to PHP
 *
 * File: raintpl.compile.class.php
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 *
 * @link http://www.raintpl.com
 * @author Federico Ulfo <info@rainelemental.net>
 * @version 1.7.6
 * @copyright 2006 - 2008 Federico Ulfo | www.RainElemental.net
 * @package RainTPL
 */




/**
 *
 * FALSE more security (DEFAULT)
 * TRUE enable <?php ?> tag in templates.
 *
 */

define( "RAINTPL_PHP_ENABLED", false );




/**
 *
 *Cache enabled:
 * TRUE improve speed
 * FALSE recompile template each executions
 *
 */

define( "RAINTPL_VERSION", '1.7.5' );



/**
 * Template engine, compile HTML template to PHP, cache templates, wysiwyg: change image src to the right path.
 *
 * @access private
 *
 */

class Sys_Content_Template_Core{
    
        private $tpl_dir = "themes";
        private $split_pattern = '/(\{(?:loop(?:\s+)name="(?:.*?)")\})|(\{(?:\/loop)\})|(\{(?:if(?:\s+)condition="(?:.*?)")\})|(\{(?:elseif(?:\s+)condition="(?:.*?)")\})|(\{(?:else)\})|(\{(?:\/if)\})|(\{noparse\})|(\{\/noparse\})|(\{ignore\})|(\{\/ignore\})|(\{include="(?:.*?)"\})|(\{lang="(?:.*?)"\})/';


         function path_replace( $html ){

		// sostituisco i percorsi di img, link e background:
		// url => template_dir/url
		// url# => url#
		// http://url => http://url

		$exp = array( '/src=(?:")http\:\/\/([^"]+?)(?:")/i', '/src=(?:")([^"]+?)#(?:")/i', '/src="(.*?)"/', '/src=(?:\@)([^"]+?)(?:\@)/i', '/background=(?:")http\:\/\/([^"]+?)(?:")/i', '/background=(?:")([^"]+?)#(?:")/i', '/background="(.*?)"/', '/background=(?:\@)([^"]+?)(?:\@)/i', '/<link(.*?)href=(?:")http\:\/\/([^"]+?)(?:")/i', '/<link(.*?)href=(?:")([^"]+?)#(?:")/i', '/<link(.*?)href="(.*?)"/', '/<link(.*?)href=(?:\@)([^"]+?)(?:\@)/i' );
		$sub = array( 'src=@http://$1@', 'src=@$1@', 'src="' . $this->tpl_dir . '\\1"', 'src="$1"', 'background=@http://$1@', 'background=@$1@', 'background="' . $this->tpl_dir . '\\1"', 'background="$1"', '<link$1href=@http://$2@', '<link$1href=@$2@' , '<link$1href="' . $this->tpl_dir . '$2"', '<link$1href="$2"' );
		return preg_replace( $exp, $sub, $html );
	}

	function compileFile( $template_name, $template_directory ){


		$this->tpl_dir = $template_directory;

		if( !file_exists( $this->tpl_dir . '/compiled/' ) )
			mkdir( $this->tpl_dir . '/compiled/', 0755 );

		if( $compiled_file = glob( $this->tpl_dir . '/compiled/' . $template_name . '*.php' ) )
			foreach( $compiled_file as $file_name )
				unlink( $file_name );

		$template_code = file_get_contents( $this->tpl_dir . '/' . $template_name . '.' . TPL_EXT );
		$template_code = preg_replace( "/\<\?xml(.*?)\?\>/", "##XML\\1XML##", $template_code );

		if( !RAINTPL_PHP_ENABLED ){
			$template_code = str_replace( "<?", "&lt;?", $template_code );
			$template_code = str_replace( "?>", "?&gt;", $template_code );
		}


		$template_code = preg_replace( "/\#\#XML(.*?)XML\#\#/", "<?php echo '<?xml\\1?>'; ?>", $template_code );


		$template_compiled = $this->compileTemplate( $template_code, $template_name );

                $tplInitStr = "<?php if(!defined('IN_RAINTPL')){exit('Hacker attempt');}";
                $tplInitStr .= "?>";

                $template_compiled = $tplInitStr . $template_compiled;



                preg_match_all('/{lang="(.*)"}/', $template_code, $langKeys);



                if (count($langKeys[1]) > 0) {
                    $langStr = '<?php ';
                    $langStr .= '$transObj = Sys_Translation::getInstance(); ';
                    foreach ($langKeys[1] as $langKey) {
                        $langStr.='$transObj->addKeys(\''.$langKey.'\'); ';
                    }
                    $langStr.=' ?> ';
                    $template_compiled=$langStr.$template_compiled;

                    
                }

		fwrite( $fp = fopen( $this->tpl_dir . "/compiled/" . $template_name . "_" . filemtime( $this->tpl_dir . '/' . $template_name . '.' . TPL_EXT ) . ".php", 'w' ), $template_compiled );

		fclose( $fp );

	}


	function compileTemplate( $template_code, $template_name ){

                preg_match_all('/{lang="(.*)"}/', $template_code, $langKeys);

		$template_code = preg_split ( $this->split_pattern, $template_code, -1, PREG_SPLIT_DELIM_CAPTURE | PREG_SPLIT_NO_EMPTY );
                $compiled_code = $this->compileCode( $template_code );


             


		return  "<!-- $template_name start -->" . "\n" .
		$compiled_code . "\n" .
		"<!-- $template_name - end -->" . "\n";



	}

	
	function compileCode( $parsed_code ){

		$parent_loop[ $level = 0 ] = $loop_name = $compiled_code = $compiled_return_code = null;
	 	$open_if = $comment_is_open = $ignore_is_open = 0;



	 	while( $html = array_shift( $parsed_code ) ){

	 		for( $space_counter = 0, $space = ""; $space_counter < $level + $open_if; $space_counter++, $space .= "	" );

	 		if( !$comment_is_open && preg_match( '/\{\/ignore\}/', $html ) )
	 			$ignore_is_open = false;

	 		elseif( $ignore_is_open ){
	 		}

	 		elseif( preg_match( '/\{\/noparse\}/', $html ) )
	 			$comment_is_open = false;

	 		elseif( $comment_is_open ){
 				$compiled_code .= $html;
	 		}

	 		elseif( preg_match( '/\{ignore\}/', $html ) )
	 			$ignore_is_open = true;

	 		elseif( preg_match( '/\{noparse\}/', $html ) )
	 			$comment_is_open = true;

			elseif( preg_match( '/(?:\{include="(.*?)"\})/', $html, $code ) ){

				$include_var = $this->var_replace( $code[ 1 ], $left_delimiter = null, $right_delimiter = null, $php_left_delimiter = '".' , $php_right_delimiter = '."', $this_loop_name = $parent_loop[ $level ] );

				$compiled_code .= "<?php\n" .
								 "\$RainTPL_include_obj = Sys_Content_Tpl::getInstance();\n" .
								 "\$RainTPL_include_obj->assign( \$var );\n" .
								 "\$RainTPL_directory_template_temp = \$RainTPL_include_obj->tpl_dir;" . "\n" .
								 ( ( $this_loop_name ) ? "\$RainTPL_include_obj->assign( \"key\", \$key" . $this_loop_name . " );\n" . "\$RainTPL_include_obj->assign( \"value\", \$value" . $this_loop_name . " );\n" : null ) .
								 "\$this->tpl_dir = \$GLOBALS[ 'RainTPL_tpl_dir' ] = \$RainTPL_include_obj->tpl_dir;" . "\n" .
								 "\$RainTPL_include_obj->draw( \"$include_var\" );" . "\n" .
								 "\$this->tpl_dir = \$GLOBALS[ 'RainTPL_tpl_dir' ] = \$RainTPL_directory_template_temp;" . "\n ?>" ;


			}

	 		//apro il tag loop
	 		elseif( preg_match( '/(?:\{loop(?:\s+)name="(.*?)"\})/', $html, $code ) ){

	 			$level++;

				$parent_loop[ $level ] = $level;

				$var = $this->var_replace( '$' . $code[ 1 ], "","", "","", $level-1 );

				$counter = "\$counter$level";
				$key = "\$key$level";
				$value = "\$value$level";

				$compiled_code .=  "<?php" . "\n" .
										$space . "	if( isset( $var ) ){" . "\n" .
										$space . "		$counter = 0;" . "\n" .
										$space . "		foreach( $var as $key => $value ){ " . "\n" .
										"?>";

			}

			elseif( preg_match( '/\{\/loop\}/', $html ) ){
				$counter = "\$counter$level";

				$level--;

				$compiled_code .=  "<?php" . "\n" .
										$space . "		$counter++;" . "\n" .
										$space . "	}" . "\n" .
										$space . "}" . "\n" .
										"?>";
			}

			elseif( preg_match( '/(?:\{if(?:\s+)condition="(.*?)"\})/', $html, $code ) ){

				$open_if++;

				$condition = $code[ 1 ];

				$parsed_condition = $this->var_replace( $condition, $tag_left_delimiter = '', $tag_right_delimiter = '', $php_left_delimiter = null, $php_right_delimiter = null, $parent_loop[$level] );

				$compiled_code .=   "<?php" . "\n" .
										 $space . "	if( $parsed_condition ){" . "\n" .
										 "?>";
			}

                        //language var replacement!
                        elseif( preg_match( '/(?:\{lang="(.*?)"\})/', $html, $code) ){
                            $langVar = $code[1];
                            $compiled_code .= '<?php echo $transObj->translate("'.$langVar.'"); ?>';
                        }

			elseif( preg_match( '/(?:\{elseif(?:\s+)condition="(.*?)"\})/', $html, $code ) ){

				$open_if++;

				$condition = $code[1];

				$parsed_condition = $this->var_replace( $condition, $tag_left_delimiter = '', $tag_right_delimiter = '', $php_left_delimiter = null, $php_right_delimiter = null, $parent_loop[$level] );

				$compiled_code .=   "<?php" . "\n" .
										 $space . "}" . "\n" .
										 $space . "	elseif( $parsed_condition ){" . "\n" .
										 "?>";
			}

			elseif( preg_match( '/\{else\}/', $html ) ){

				$compiled_code .=   "<?php" . "\n" .
										 $space . "}" . "\n" .
										 $space . "else{" . "\n" .
										 "?>";

			}

			elseif( preg_match( '/\{\/if}/', $html ) ){

				$open_if--;

				$compiled_code .=   "<?php" . "\n" .
										 $space . "}" . "\n" .
										 "?>";

			}

			else{

                                $html = $this->path_replace( $html );
				$compiled_code .= $this->var_replace( $html, $left_delimiter = '\{', $right_delimiter = '\}', $php_left_delimiter = '<?php echo ', $php_right_delimiter = ';?>', $parent_loop[ $level ] );

                        }
		}

		return $compiled_code;
	}

	function var_replace( $html, $tag_left_delimiter, $tag_right_delimiter, $php_left_delimiter = null, $php_right_delimiter = null, $loop_name = null ){

		$html = preg_replace( '/\{\#(\w+)\#\}/', $php_left_delimiter . '\\1' . $php_right_delimiter, $html );
		preg_match_all( '/' . $tag_left_delimiter . '\$(\w+(?:\.\${0,1}(?:\w+))*(?:\[\${0,1}(?:\w+)\])*(?:\-\>\${0,1}(?:\w+))*)(.*?)' . $tag_right_delimiter . '/', $html, $matches );

		for( $i = 0; $i < count( $matches[ 0 ] ); $i++ ){


			$tag = $matches[ 0 ][ $i ];


			$var = $matches[ 1 ][ $i ];
			$extra_var = $matches[ 2 ][ $i ];
			$function_var = ( $extra_var and $extra_var[0] == '|') ? substr( $extra_var, 1 ) : null;
			$temp = preg_split( "/\.|\[|\-\>/", $var );
			$var_name = $temp[ 0 ];
			$variable_path = substr( $var, strlen( $var_name ) );

			$variable_path = str_replace( '[', '["', $variable_path );
			$variable_path = str_replace( ']', '"]', $variable_path );


			$variable_path = preg_replace('/\.\$(\w+)/', '["$\\1"]', $variable_path );
			$variable_path = preg_replace('/\.(\w+)/', '["\\1"]', $variable_path );

			if( $function_var ){

				$function_split = explode( ':', $function_var, 2 );

				$function = $function_split[ 0 ];

				$params = ( isset( $function_split[ 1 ] ) ) ? $function_split[ 1 ] : null;

			}
			else
				$function = $params = null;


			if( $loop_name ){

				if( $var_name == 'key' )
					$php_var = '$key' . $loop_name;
				elseif( $var_name == 'value' )
					$php_var = '$value' . $loop_name . $variable_path;
				elseif( $var_name == 'counter' )
					$php_var = '$counter' . $loop_name;
				else
					$php_var = '$var["' . $var_name . '"]' . $variable_path;
			}
			elseif( $var_name == 'GLOBALS' )
				$php_var = '$GLOBALS' . $variable_path;
			elseif( $var_name == '_SESSION' )
				$php_var = '$_SESSION' . $variable_path;
			elseif( $var_name == '_COOKIE' )
				$php_var = '$_COOKIE' . $variable_path;
			elseif( $var_name == '_SERVER' )
				$php_var = '$_SERVER' . $variable_path;
			elseif( $var_name == '_GET' )
				$php_var = '$_GET' . $variable_path;
			elseif( $var_name == '_POST' )
				$php_var = '$_POST' . $variable_path;
			else
				$php_var = '$var["' . $var_name . '"]' . $variable_path;


			if( isset( $function ) )
				$php_var = $php_left_delimiter . ( $params ? "( $function( $php_var, $params ) )" : "$function( $php_var )" ) . $php_right_delimiter;
			else
				$php_var = $php_left_delimiter . $php_var . $extra_var . $php_right_delimiter;

			$html = str_replace( $tag, $php_var, $html );

		}



		return $html;
	}

}

