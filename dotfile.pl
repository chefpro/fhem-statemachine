#!/usr/bin/perl
use strict;
use warnings;

my $string = "{ \
 LongClickAn => [ { event => '\$1:long-click', newState => 'GartenScheuneHof'  },  \
                  { event => '\$2:long-click', newState => 'GartenScheuneHof'  },  \
                  { event => '\$3:long-click', newState => 'GartenScheuneHof'  },  \
 ], \
 DoubleClickTimer => [ { event => '\$1:double-click', newState => 'HofVerlassen'  },  \
                       { event => '\$2:double-click', newState => 'GartenVerlassen'  },  \
                       { event => '\$3:double-click', newState => 'GartenVerlassen'  },  \
 ], \
 LongClickOFF => [ { event => '\$1:long-click', newState => 'OFF'  },  \
                   { event => '\$2:long-click', newState => 'OFF'  },  \
                   { event => '\$3:long-click', newState => 'OFF'  },  \
 ], \
 Generic => [ \
 ], \
 OFF => [ { enter => 'set G_Hof_Hauptlicht OFF;set G_Scheune_Hauptlicht OFF;set G_Terrasse_Hauptlicht OFF;set G_Garten_Hauptlicht OFF;', groups => 'LongClickAn,DoubleClickTimer,Generic' },  \
                  { event => '\$1:short-click', newState => 'Hof'  },  \
                  { event => '\$2:short-click', newState => 'ScheuneHof'  },  \
                  { event => '\$3:short-click', newState => 'GartenScheune'  },  \
 ], \
 An => [ { enter => 'set G_Hof_Hauptlicht ON;set G_Scheune_Hauptlicht ON;set G_Terrasse_Hauptlicht ON;set G_Garten_Hauptlicht ON;', groups => 'LongClickOFF,DoubleClickTimer,Generic' },  \
                  { event => '\$1:short-click', newState => 'GartenTerrasseScheune'  },  \
                  { event => '\$2:short-click', newState => 'GartenTerrasseScheune'  },  \
                  { event => '\$3:short-click', newState => 'ScheuneHof'  },  \
 ], \
 Garten => [ { enter => 'set G_Hof_Hauptlicht OFF;set G_Scheune_Hauptlicht OFF;set G_Terrasse_Hauptlicht OFF;set G_Garten_Hauptlicht ON;', groups => 'LongClickAn,DoubleClickTimer,Generic' },  \
                  { event => '\$1:short-click', newState => 'GartenHof'  },  \
                  { event => '\$2:short-click', newState => 'ScheuneHof'  },  \
                  { event => '\$3:short-click', newState => 'GartenScheune'  },  \
 ], \
 GartenHof => [ { enter => 'set G_Hof_Hauptlicht ON;set G_Scheune_Hauptlicht OFF;set G_Terrasse_Hauptlicht OFF;set G_Garten_Hauptlicht ON;', groups => 'LongClickAn,DoubleClickTimer,Generic' },  \
                  { event => '\$1:short-click', newState => 'Garten'  },  \
                  { event => '\$2:short-click', newState => 'GartenScheuneHof'  },  \
                  { event => '\$3:short-click', newState => 'GartenScheuneHof'  },  \
 ], \
 Terrasse => [ { enter => 'set G_Hof_Hauptlicht OFF;set G_Scheune_Hauptlicht OFF;set G_Terrasse_Hauptlicht ON;set G_Garten_Hauptlicht OFF;', groups => 'LongClickAn,DoubleClickTimer,Generic' },  \
                  { event => '\$1:short-click', newState => 'TerrasseHof'  },  \
                  { event => '\$2:short-click', newState => 'TerasseScheuneHof'  },  \
                  { event => '\$3:short-click', newState => 'TerasseScheune'  },  \
 ], \
 TerrasseHof => [ { enter => 'set G_Hof_Hauptlicht ON;set G_Scheune_Hauptlicht OFF;set G_Terrasse_Hauptlicht ON;set G_Garten_Hauptlicht OFF;', groups => 'LongClickAn,DoubleClickTimer,Generic' },  \
                  { event => '\$1:short-click', newState => 'Terrasse'  },  \
                  { event => '\$2:short-click', newState => 'TerrasseScheuneHof'  },  \
                  { event => '\$3:short-click', newState => 'TerrasseScheuneHof'  },  \
 ], \
 Scheune => [ { enter => 'set G_Hof_Hauptlicht OFF;set G_Scheune_Hauptlicht ON;set G_Terrasse_Hauptlicht OFF;set G_Garten_Hauptlicht OFF;', groups => 'LongClickAn,DoubleClickTimer,Generic' },  \
                  { event => '\$1:short-click', newState => 'ScheuneHof'  },  \
                  { event => '\$2:short-click', newState => 'ScheuneHof'  },  \
                  { event => '\$3:short-click', newState => 'An'  },  \
 ], \
 Hof => [ { enter => 'set G_Hof_Hauptlicht ON;set G_Scheune_Hauptlicht OFF;set G_Terrasse_Hauptlicht OFF;set G_Garten_Hauptlicht OFF;' , groups => 'LongClickAn,DoubleClickTimer,Generic'},  \
                  { event => '\$1:short-click', newState => 'OFF'  },  \
                  { event => '\$2:short-click', newState => 'ScheuneHof'  },  \
                  { event => '\$3:short-click', newState => 'GartenScheune'  },  \
 ], \
 ScheuneHof => [ { enter => 'set G_Hof_Hauptlicht ON;set G_Scheune_Hauptlicht ON;set G_Terrasse_Hauptlicht OFF;set G_Garten_Hauptlicht OFF;', groups => 'LongClickAn,DoubleClickTimer,Generic' },  \
                  { event => '\$1:short-click', newState => 'Scheune'  },  \
                  { event => '\$2:short-click', newState => 'Scheune'  },  \
                  { event => '\$3:short-click', newState => 'GartenScheune'  },  \
 ], \
 GartenScheune => [ { enter => 'set G_Hof_Hauptlicht OFF;set G_Scheune_Hauptlicht ON;set G_Terrasse_Hauptlicht OFF;set G_Garten_Hauptlicht ON;', groups => 'LongClickAn,DoubleClickTimer,Generic' },  \
                  { event => '\$1:short-click', newState => 'GartenScheuneHof'  },  \
                  { event => '\$2:short-click', newState => 'GartenScheuneHof'  },  \
                  { event => '\$3:short-click', newState => 'GartenTerrasseScheune'  },  \
 ], \
 GartenTerrasse => [ { enter => 'set G_Hof_Hauptlicht OFF;set G_Scheune_Hauptlicht OFF;set G_Terrasse_Hauptlicht ON;set G_Garten_Hauptlicht ON;', groups => 'LongClickAn,DoubleClickTimer,Generic' },  \
                  { event => '\$1:short-click', newState => 'An'  },  \
                  { event => '\$2:short-click', newState => 'GartenTerrasseScheune'  },  \
                  { event => '\$3:short-click', newState => 'GartenTerrasseScheune'  },  \
 ], \
 GartenTerrasseScheune => [ { enter => 'set G_Hof_Hauptlicht OFF;set G_Scheune_Hauptlicht ON;set G_Terrasse_Hauptlicht ON;set G_Garten_Hauptlicht ON;', groups => 'LongClickAn,DoubleClickTimer,Generic' },  \
                  { event => '\$1:short-click', newState => 'An'  },  \
                  { event => '\$2:short-click', newState => 'An'  },  \
                  { event => '\$3:short-click', newState => 'GartenTerrasse'  },  \
 ], \
 GartenScheuneHof => [ { enter => 'set G_Hof_Hauptlicht ON;set G_Scheune_Hauptlicht ON;set G_Terrasse_Hauptlicht OFF;set G_Garten_Hauptlicht ON;', groups => 'LongClickOFF,DoubleClickTimer,Generic' },  \
                  { event => '\$1:short-click', newState => 'GartenScheune'  },  \
                  { event => '\$2:short-click', newState => 'GartenScheune'  },  \
                  { event => '\$3:short-click', newState => 'ScheuneHof'  },  \
 ], \
 TerrasseScheuneHof => [ { enter => 'set G_Hof_Hauptlicht ON;set G_Scheune_Hauptlicht ON;set G_Terrasse_Hauptlicht ON;set G_Garten_Hauptlicht OFF;', groups => 'LongClickAn,DoubleClickTimer,Generic' },  \
                  { event => '\$1:short-click', newState => 'TerrasseScheune'  },  \
                  { event => '\$2:short-click', newState => 'TerrasseScheune'  },  \
                  { event => '\$3:short-click', newState => 'An'  },  \
 ], \
 TerrasseScheune => [ { enter => 'set G_Hof_Hauptlicht OFF;set G_Scheune_Hauptlicht ON;set G_Terrasse_Hauptlicht ON;set G_Garten_Hauptlicht OFF;', groups => 'LongClickAn,DoubleClickTimer,Generic' },  \
                  { event => '\$1:short-click', newState => 'TerrasseScheuneHof'  },  \
                  { event => '\$2:short-click', newState => 'TerrasseScheuneHof'  },  \
                  { event => '\$3:short-click', newState => 'GartenTerrasseScheune'  },  \
 ], \
 GartenVerlassen => [ { enter => 'set G_Hof_Hauptlicht ON;set G_Scheune_Hauptlicht ON;set G_Terrasse_Hauptlicht OFF;set G_Garten_Hauptlicht ON;sleep 0.5;set G_Hof_Hauptlicht OFF;set G_Scheune_Hauptlicht OFF;set G_Terrasse_Hauptlicht OFF;set G_Garten_Hauptlicht OFF;sleep 0.5;set G_Hof_Hauptlicht ON;set G_Scheune_Hauptlicht ON;set G_Terrasse_Hauptlicht OFF;set G_Garten_Hauptlicht ON;', \
                        leave => 'set G_Hof_Hauptlicht OFF;set G_Scheune_Hauptlicht OFF;set G_Terrasse_Hauptlicht OFF;set G_Garten_Hauptlicht OFF;sleep 0.5;', \
                        groups => 'LongClickAn,Generic' },  \
                  { timeout => 120, newState => 'OFF'  },  \
                  { event => '\$1:short-click', newState => 'GartenScheuneHof'  },  \
                  { event => '\$2:short-click', newState => 'GartenScheuneHof'  },  \
                  { event => '\$3:short-click', newState => 'GartenScheuneHof'  },  \
                  { event => '\$1:double-click', newState => 'OFF'  },  \
                  { event => '\$2:double-click', newState => 'OFF'  },  \
                  { event => '\$3:double-click', newState => 'OFF'  },  \
 ], \
 HofVerlassen => [ { enter => 'set G_Hof_Hauptlicht ON;set G_Scheune_Hauptlicht ON;set G_Terrasse_Hauptlicht OFF;set G_Garten_Hauptlicht OFF;sleep 0.5;set G_Hof_Hauptlicht OFF;set G_Scheune_Hauptlicht OFF;set G_Terrasse_Hauptlicht OFF;set G_Garten_Hauptlicht OFF;sleep 0.5;set G_Hof_Hauptlicht ON;set G_Scheune_Hauptlicht ON;set G_Terrasse_Hauptlicht OFF;set G_Garten_Hauptlicht OFF;', \
                     leave => 'set G_Hof_Hauptlicht OFF;set G_Scheune_Hauptlicht OFF;set G_Terrasse_Hauptlicht OFF;set G_Garten_Hauptlicht OFF;sleep 0.5;', \
                     groups => 'LongClickAn,Generic' },  \
                  { timeout => 10, newState => 'OFF'  },  \
                  { event => '\$1:short-click', newState => 'GartenScheuneHof'  },  \
                  { event => '\$2:short-click', newState => 'GartenScheuneHof'  },  \
                  { event => '\$3:short-click', newState => 'GartenScheuneHof'  },  \
                  { event => '\$1:double-click', newState => 'OFF'  },  \
                  { event => '\$2:double-click', newState => 'OFF'  },  \
                  { event => '\$3:double-click', newState => 'OFF'  },  \
 ], \
}";

sub
getSettingTransition($)
{
  my ($current_state) = @_;
  return undef if( ref($current_state) ne 'ARRAY' );

   foreach my $t (@{$current_state}) {
     return $t if( defined($t->{enter}) || defined($t->{leave}) || defined($t->{groups}));
   }

  return undef;
}

sub handle_groups {
  my ($states) = @_;
  my @keys = keys %{$states};
  foreach my $key (@keys) {
    if( my $setting = getSettingTransition($states->{$key}) ) {
      if( my $groups_setting = $setting->{groups} ) {
        my @groups = split(/,/, $groups_setting);
        foreach my $group (@groups) {
          push @{$states->{$key}}, @{$states->{$group}};
        }
      }
    }
  }
}

sub generate_dot_file {
  my ($states, $event, $filename) = @_;
  my @keys = keys %{$states};
  # eliminate pure groups
  my %pure_groups;
  # get all groups
  foreach my $key (@keys) {
    my $transitions = $states->{$key};
    if( my $setting = getSettingTransition($transitions) ) {
      if( my $groups_setting = $setting->{groups} ) {
        my @groups = split(/,/, $groups_setting);
        foreach my $group (@groups) {
          $pure_groups{$group} = 1;
        }
      }
    }
  }
  # eliminate reachable groups
  foreach my $key (@keys) {
    my $transitions = $states->{$key};
    foreach my $transition (@{$transitions}) {
      if (defined($transition->{newState})) {
        if (exists($pure_groups{$transition->{newState}})) {
          delete($pure_groups{$transition->{newState}});
        }
      }
    }
  }
  open(my $fh, '>', $filename);
  print $fh "digraph G {\n";
  foreach my $key (@keys) {
    if (exists($pure_groups{$key})) {
      next;
    }
    my $transitions = $states->{$key};
    print $fh  $key . " [shape=none,margin=0,label=<<table BORDER= \"0\" CELLBORDER=\"1\" CELLSPACING=\"0\" CELLPADDING=\"4\">\n";
    print $fh "<tr><td><b>" . $key . "</b></td></tr>\n";
    # generate enter, group and leave lables
    if( my $setting = getSettingTransition($transitions) ) {
      if( my $enters_setting = $setting->{enter} ) {
        print $fh "<tr><td><font COLOR=\"blue\">enter:</font><br/>\n";
        my @enters = split(/;/, $enters_setting);
        foreach my $enter (@enters) {
          print $fh $enter . "<br/>\n";
        }
        print $fh "</td></tr>\n";
      }
      if( my $leaves_setting = $setting->{leave} ) {
        print $fh "<tr><td><font COLOR=\"blue\">leave:</font><br/>\n";
        my @leaves = split(/;/, $leaves_setting);
        foreach my $leave (@leaves) {
          print $fh $leave . "<br/>\n";
        }
        print $fh "</td></tr>\n";
      }
      if( my $groups_setting = $setting->{groups} ) {
        print $fh "<tr><td><font COLOR=\"blue\">groups:</font><br/>\n";
        my @groups = split(/,/, $groups_setting);
        foreach my $group (@groups) {
          print $fh $group . "<br/>\n";
        }
        print $fh "</td></tr>\n";
      }
    }
    print $fh "</table>>];\n";
    # generate transitions
    foreach my $transition (@{$transitions}) {
      if (defined($transition->{newState})) {
        if (defined($transition->{event})) {
          if ($transition->{event} =~ /$event/) {
            print $fh $key . " -> " . $transition->{newState};
            print $fh " [label=\"" . $transition->{event} . "\"]";
            print $fh "\n";
          }
        }
        if (defined($transition->{timeout})) {
          print $fh $key . " -> " . $transition->{newState};
          print $fh "[label=\"timeout=" . $transition->{timeout} . "\"]";
          print $fh "\n";
        }
      }
    }
  }
  print $fh "}\n";
  close $fh;
  #generate png file
  system("dot", "-Tpng", $filename, "-o", $filename.".png")
}

my $states = eval $string;
handle_groups($states);
generate_dot_file($states, "1:short", "event1.dot");
generate_dot_file($states, "2:short", "event2.dot");
generate_dot_file($states, "3:short", "event3.dot");
generate_dot_file($states, "4:short", "event4.dot");
generate_dot_file($states, "", "all.dot");
