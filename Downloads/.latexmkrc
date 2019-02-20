# Generated files with the %R prefix:
push @generated_exts, 'timestamp', 'hash', 'blocks';

# Additional files per code environment:
$clean_ext .= " %R*.code";
$clean_ext .= " %R*.result";
$clean_ext .= " %R*.traceback";

$jupytex = 'jupytex execute %S %O';

foreach my $cmd ('latex', 'lualatex', 'pdflatex', 'xelatex' ) {
	${$cmd} = "internal latex_jupyter %R %Y $cmd %O %S";
}

sub latex_jupyter {
   # Run *latex, then set jupytex rule if needed.
   # Arguments: Root name, directory for aux files (with terminator),
   #            latex program to run, arguments for latex.

   my $root = shift;
   my $dir_string = shift;
   my $pytx_code = "$dir_string$root.hash";
   my $pytx_out_file = "$dir_string$root.timestamp";

   my $pytx_rule_name = "jupytex execute $root";
   my $ret = system @_;

   if ( test_gen_file( $pytx_code ) ) {
       print "=== JupyTeX being used\n";
       if (! rdb_rule_exists( $pytx_rule_name ) ) {
           print "=== Creating rule '$pytx_rule_name'\n";
	   rdb_create_rule( $pytx_rule_name, 'external', $jupytex, '', 1,
	                    $pytx_code, $pytx_out_file, $root, 1 );
           system "echo No file \"$pytx_out_file\". >> \"$dir_string$root.log\"";
       }
   }
   return $ret;
}

