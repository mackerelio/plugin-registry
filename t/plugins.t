use 5.014;
use warnings;
use utf8;
use Test::More;
use JSON::PP qw/decode_json/;

for my $file (<./plugins/*.json>) {
    subtest $file => sub {
        my $json = eval {
            decode_json do {
                local $/;
                open my $fh, '<:encoding(UTF-8)', $file or die $!;
                <$fh>
            };
        };
        ok !$@, "valid JSON";
        ok $json->{source}, "has source";
        ok $json->{description}, "has description";

        ok $json->{source} =~ m|\A[-_.a-zA-Z0-9]+/[-_.a-zA-Z0-9]+\Z|, 'source is valid'
    };
}

done_testing;
