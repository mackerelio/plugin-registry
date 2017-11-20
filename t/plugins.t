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

        my $valid = like $json->{source}, qr|\A[-_.a-zA-Z0-9]+/[-_.a-zA-Z0-9]+\Z|, 'source is valid';
        # test only safe sources
        if ($valid) {
            # curl -f exits with 0 when request succeeded
            my $curl_failed = system('curl -fsLI -o /dev/null https://github.com/'.$json->{source});
            ok ! $curl_failed, "source github repository is accessible";
            sleep 1;
        }
    };
}

done_testing;
