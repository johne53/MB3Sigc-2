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
$exec_prefix = "lib";

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
	    s/\@prefix@/$prefix/g;
	    s/\@exec_prefix@/$exec_prefix/g;
	    s/\@includedir@/$generic_include_folder/g;
	    s/\@libdir@/$generic_library_folder/g;
	    print OUTPUT;
	}
}

my $command=join(' ',@ARGV);

if (-1 != index($command, "-X64")) {
	$sigc_api_version = "64-2.0";
} else {
	$sigc_api_version = "32-2.0";
}

process_file ("sigc++config.h");
process_file ("sigc++.pc");

if (-1 != index($command, "-buildall")) {
	process_file ("MSVC_Net2005/sigc++.vsprops");
	process_file ("MSVC_Net2005/sigc.rc");
}