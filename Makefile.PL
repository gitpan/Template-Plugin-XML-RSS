use ExtUtils::MakeMaker;

WriteMakefile(
    NAME	   => 'Template::Plugin::XML::RSS',
    VERSION_FROM   => 'RSS.pm',
    PREREQ_PM      => { Template => 1.02, XML::RSS => 0.8 },
    'dist'         => {
	COMPRESS   => 'gzip',
	SUFFIX     => 'gz',
    },
);

