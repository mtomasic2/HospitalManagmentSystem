<?php
function my_err($obj){
    echo "\n";
    foreach ($obj as $key => $value) {
        echo "$key: $value\n";
    }
}
