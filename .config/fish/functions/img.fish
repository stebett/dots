function img
    set file $argv
    set thumbnail /tmp/thumb.$argv
    convert -thumbnail x200 $file $thumbnail
    echo -e "0;0;\n0;1;0;0;0;0;0;0;0;0;$thumbnail\n4;\n3;" | /usr/lib/w3m/w3mimgdisplay
    echo -e "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n";
end


