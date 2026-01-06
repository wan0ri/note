use strict; use warnings; use utf8; binmode STDIN, ':encoding(UTF-8)';
binmode STDOUT, ':encoding(UTF-8)';
my $outdir = shift @ARGV or die "no outdir";
my ($cur, $fh);
sub close_cur{ if ($fh){ close $fh; undef $fh; undef $cur; } }
sub filename_for{
  my ($title) = @_;
  my $s = $title;
  $s =~ s/^(Amazon|AWS)\s+//i;
  if ($s =~ /\(([A-Z0-9]{2,})\)/){ return "$1.md"; }
  $s =~ s/\s*\(.+//;           # drop parenthetical rest
  $s =~ s/[^A-Za-z0-9]//g;       # strip non-alnum, preserve caps
  $s = $s || 'Service';
  return "$s.md";
}
while( my $line = <STDIN> ){
  if ($line =~ /^##\s+(.*)/){
    my $title = $1; $title =~ s/\s+$//;
    close_cur();
    my $fn = filename_for($title);
    my $path = "$outdir/$fn";
    open($fh, '>:encoding(UTF-8)', $path) or die $!;
    print $fh "---\n";
    print $fh "title: $title\n";
    print $fh "---\n\n";
    next;
  }
  if ($fh){ print $fh $line; }
}
close_cur();
