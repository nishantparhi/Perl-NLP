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

# Looks for various key words and either reworks those statements into questions or prompts the user to
# give more information about what they said.
sub form_response {
  $line = $_[0];

  if ($line =~ m/\bneed\b/) {
    $line =~ s/(.*) need (.*)/Can you tell me why you need $2\?/;
  }
  elsif ($line =~ m/\bwant\b/) {
    $line =~ s/(.*) want (.*)/Why do you want $2\?/;
  }
  elsif ($line =~ m/likes(s)?/) {
    $line =~ s/(.*)likes (.*)/What is the significance of liking $2\?/;
  }
  elsif ($line =~ m/I think/) {
    $line =~ s/(.*)I think (.*)/Why do you think $2\?/;
  }
  elsif ($line =~ m/I am/) {
    $line =~ s/(.*)I am (.*)/$name, why do you think you are $2\?/;
  }
  elsif ($line =~ m/([Tt]hey're|[Tt]hey are)/) {
    $line =~ s/(.*)([Tt]hey're |[Tt]hey are )(.*)/Can you tell me why you think they are $3\?/;
  }
  elsif ($line =~ m/(feel|feeling)/) {
    $line =~ s/(.*) (feel|feeling) (.*)/Hmm, what is making you feel $3\?/;
  }
  elsif ($line =~ m/\b(crave|craving)\b/) {
    $line = "Why don't you tell me more about your cravings $name?";
  }
  elsif ($line =~ m/\bdesire(s)?\b/) {
    $line =~ s/(.*)desire (.*)/What makes you desire $2\?/;
  }
  elsif ($line =~ m/love/) {
    $line =~ s/(.*) love (.*)/Tell more more about this love you feel./;
  }
  # Checking for different relations one could have, and prompting the user to talk more about them.
  elsif ($line =~ m/(friend(s)?|boyfriend|girlfriend|wife|husband|mom|dad|brother|sister)/) {
    $line = "Can you say more about the people you are talking about?";
  }
  # The last elsif is a safety net to try and keep the conversation going normally.
  elsif ($line =~ m/(problem(s?)|issue(s?)|been|keep|have)/) {
    $line = "Tell me more about it."
  }
  # Eenter different input.
  else {
    $line = "I'm sorry $name, I didn't quite understand that.  Could you say it in a different way?";
  }

  print $line;
  print "\n";
}
