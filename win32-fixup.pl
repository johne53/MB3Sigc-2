#! e:/program files/perl/bin/perl.exe
#  version info can be found in 'NEWS'

require "../local-paths.lib";

$package_string = "\"sigc++ 2.3.1\"";
$package_version = "2.3.1";
$major = 2;
$minor = 3;
$micro = 1;
$binary_age = 301;
$interface_age = 1;
$current_minus_age = 0;

sub process_file
{
        my $outfilename = shift;
	my $infilename = $outfilename . ".in";
	
	open (INPUT, "< $infilename") || exit 1;
	open (OUTPUT, "> $outfilename") || exit 1;
	
	while (<INPUT>) {
	    s/\@SIGCXX_MAJOR_VERSION\@/$major/g;
	    s/\@SIGCXX_MINOR_VERSION\@/$minor/g;
	    s/\@SIGCXX_MICRO_VERSION\@/$micro/g;
	    s/\@SIGCXX_BINARY_AGE\@/$binary_age/g;
	    s/\@SIGCXX_INTERFACE_AGE\@/$interface_age/g;
	    s/\@SIGCXX_API_VERSION\@/$sigc_api_version/g;
	    s/\@LT_CURRENT_MINUS_AGE\@/$current_minus_age/g;
	    s/\@PACKAGE_STRING@/$package_string/g;
	    s/\@PACKAGE_VERSION@/$package_version/g;
	    s/\@GenericIncludeFolder@/$generic_include_folder/g;
	    s/\@GenericLibraryFolder@/$generic_library_folder/g;
	    s/\@GenericWin32LibraryFolder@/$generic_win32_library_folder/g;
	    s/\@GenericWin32BinaryFolder@/$generic_win32_binary_folder/g;
	    s/\@Debug32TestSuiteFolder@/$debug32_testsuite_folder/g;
	    s/\@Release32TestSuiteFolder@/$release32_testsuite_folder/g;
	    s/\@Debug32TargetFolder@/$debug32_target_folder/g;
	    s/\@Release32TargetFolder@/$release32_target_folder/g;
	    s/\@TargetSxSFolder@/$target_sxs_folder/g;
	    print OUTPUT;
	}
}

process_file ("sigc++config.h");

my $command=join(' ',@ARGV);
if ($command eq -buildall) {
	process_file ("MSVC_Net2005/sigc++.vsprops");
	process_file ("MSVC_Net2005/sigc.rc");
}