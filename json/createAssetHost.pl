#!/usr/bin/env perl
# Copyright 2015, Petr, Frank Breedijk
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# ------------------------------------------------------------------------------
# Updates an asset
# ------------------------------------------------------------------------------
use strict;
use CGI;
use CGI::Carp qw(fatalsToBrowser);
use JSON;
use lib "..";
use SeccubusV2;
use SeccubusAssets;

my $query = CGI::new();
my $json = JSON->new();

print $query->header(-type => "application/json", -expires => "-1d", -"Cache-Control"=>"no-store, no-cache, must-revalidate", -"X-Clacks-Overhead" => "GNU Terry Pratchett");

my $params = $query->Vars;
my $workspace_id = $params->{workspace};
my $asset_id = $params->{asset};
my $ip = $params->{ip};
my $host = $params->{host};

# Return an error if the required parameters were not passed 
bye("Parameter workspace is missing") if(not (defined ($workspace_id)));
bye("Parameter asset is missing") if(not (defined ($asset_id)));
bye("Parameter ip is missing") if(not (defined ($ip)));

eval {
	my @data = ();
	my $newid = create_asset_host($workspace_id,$asset_id,$ip,$host);
	push @data, {
		id => $newid,
		ip	=> $ip,
		host 	=> $host,
		workspace => $workspace_id
	};
	print $json->pretty->encode(\@data);
} or do{
	bye (join "\n", $@);
};

sub bye($){
	my $error = shift;
	print $json->pretty->encode([{ error => $error}]);
	exit;
}