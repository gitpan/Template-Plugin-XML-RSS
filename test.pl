#============================================================= -*-perl-*-
#
# test.pl
#
# Simple test script for Template Toolkit XML::RSS plugin.
#
# Written by Andy Wardley <abw@cre.canon.co.uk>
#
# Copyright (C) 1998-1999 Canon Research Centre Europe Ltd.
# All Rights Reserved.
#
# This is free software; you can redistribute it and/or modify it
# under the same terms as Perl itself.
#
# $Id: test.pl,v 1.2 2000/01/13 16:58:26 abw Exp $
#
#========================================================================

use strict;
use Template;
use Template::Test;
$^W = 1;

$Template::Test::DEBUG = 0;

test_expect(\*DATA, undef, { newsfile => 'example.rdf' });

__DATA__
[% USE news = XML.RSS(newsfile) -%]
[% FOREACH item = news.items -%]
* [% item.title %]
  [% item.link  %]

[% END %]

-- expect --
* I Read the News Today
  http://oh.boy.com/

* I am the Walrus
  http://goo.goo.ga.joob.org/

-- test --
[% USE news = XML.RSS(newsfile) -%]
[% news.channel.title %]
[% news.channel.link %]

-- expect --
Template Toolkit XML::RSS Plugin
http://template-toolkit.org/plugins/XML/RSS

-- test --
[% USE news = XML.RSS(newsfile) -%]
[% news.image.title %]
[% news.image.url %]

-- expect --
Test Image
http://www.myorg.org/images/test.png

