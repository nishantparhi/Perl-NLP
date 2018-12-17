print "\nHello! My name is lisa. What is your name? \n";

# Getting the user's name, handles different ways the user could input their name.
while (<>) {
  $name = $_;
  chomp $name;
  if ($name =~ m/[.!?]$/) { chop $name; }
  if ($name =~ m/(My name is |It's |I'm|I am )(\w+)/) {
    $name =~ s/(My name is |It's |I'm|I am )(\w+)/$2/;
    last;
  }