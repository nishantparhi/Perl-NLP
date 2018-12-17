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
    # If we're still here after the if statement then our input wasn't formatted correctly.
  print "I'm sorry, I didn't quite get that.  Could you please tell me your name again? Maybe try a different way.\n";
}

print "Nice to meet you $name, how can I assist you today?\n";

# Grabs user input and cuts off any ending punctuation.  Replaces first person with second person references.
# Passes input to a function for forming the response.
while(<>) {
  chomp $_;
  if ($_ =~ m/[.!?]$/) { chop $_; }
  $_ =~ s/\bI'm\b/you are/;
  $_ =~ s/\b[Mm]y\b/your/;
  $_ =~ s/\b[Mm]e\b/you/;
  $_ =~ s/\bI\b/you/;
  form_response($_);
}