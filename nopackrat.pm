#!/usr/bin/perl
########################################################################################
#
#    This file was generated using Parse::Eyapp version 1.165.
#
# (c) Parse::Yapp Copyright 1998-2001 Francois Desarmenien.
# (c) Parse::Eyapp Copyright 2006-2008 Casiano Rodriguez-Leon. Universidad de La Laguna.
#        Don't edit this file, use source file 'nopackrat.eyp' instead.
#
#             ANY CHANGE MADE HERE WILL BE LOST !
#
########################################################################################
package nopackrat;
use strict;

push @nopackrat::ISA, 'Parse::Eyapp::Driver';




BEGIN {
  # This strange way to load the modules is to guarantee compatibility when
  # using several standalone and non-standalone Eyapp parsers

  require Parse::Eyapp::Driver unless Parse::Eyapp::Driver->can('YYParse');
  require Parse::Eyapp::Node unless Parse::Eyapp::Node->can('hnew'); 
}
  

# Default lexical analyzer
our $LEX = sub {
    my $self = shift;

    for (${$self->input}) {
      

      m{\G(\s+)}gc and $self->tokenline($1 =~ tr{\n}{});

      m{\G(x)}gc and return ($1, $1);



      return ('', undef) if ($_ eq '') || (defined(pos($_)) && (pos($_) >= length($_)));
     # /\G\s*(\S+)/;
     # my $near = substr($1,0,10); 
     # die( "Error inside the lexical analyzer near '". $near
     #     ."'. Line: ".$self->line()
     #     .". File: '".$self->YYFilename()."'. No match found.\n");
    }
  }
;


sub unexpendedInput { defined($_) ? substr($_, (defined(pos $_) ? pos $_ : 0)) : '' }


#line 56 ./nopackrat.pm

my $warnmessage =<< "EOFWARN";
Warning!: Did you changed the \@nopackrat::ISA variable inside the header section of the eyapp program?
EOFWARN

sub new {
  my($class)=shift;
  ref($class) and $class=ref($class);

  warn $warnmessage unless __PACKAGE__->isa('Parse::Eyapp::Driver'); 
  my($self)=$class->SUPER::new( 
    yyversion => '1.165',
    yyGRAMMAR  =>
[
  [ '_SUPERSTART' => '$start', [ 'S', '$end' ], 0 ],
  [ 'S_is_x_S_x' => 'S', [ 'x', 'isInTheMiddle', 'S', 'x' ], 0 ],
  [ 'S_is_x:MIDx' => 'S', [ 'x', 'isInTheMiddle' ], 0 ],
  [ 'isInTheMiddle' => 'isInTheMiddle', [  ], 0 ],
],
    yyTERMS  =>
{ '' => { ISSEMANTIC => 0 },
	x => { ISSEMANTIC => 1 },
	error => { ISSEMANTIC => 0 },
},
    yyFILENAME  => 'nopackrat.eyp',
    yystates =>
[
	{#State 0
		ACTIONS => {
			'x' => 2
		},
		GOTOS => {
			'S' => 1
		}
	},
	{#State 1
		ACTIONS => {
			'' => 3
		}
	},
	{#State 2
		DEFAULT => -3,
		GOTOS => {
			'isInTheMiddle' => 4
		}
	},
	{#State 3
		DEFAULT => 0
	},
	{#State 4
		ACTIONS => {
			'x' => 2
		},
		DEFAULT => -2,
		GOTOS => {
			'S' => 5
		}
	},
	{#State 5
		ACTIONS => {
			'x' => 6
		}
	},
	{#State 6
		DEFAULT => -1
	}
],
    yyrules  =>
[
	[#Rule _SUPERSTART
		 '$start', 2, undef
#line 128 ./nopackrat.pm
	],
	[#Rule S_is_x_S_x
		 'S', 4,
sub {
#line 0 "nopackrat.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 135 ./nopackrat.pm
	],
	[#Rule S_is_x:MIDx
		 'S', 2,
sub {
#line 0 "nopackrat.eyp"
 goto &Parse::Eyapp::Driver::YYBuildAST }
#line 142 ./nopackrat.pm
	],
	[#Rule isInTheMiddle
		 'isInTheMiddle', 0,
sub {
#line 20 "nopackrat.eyp"
  my $self = $_[0];
  for (${$self->input()}) {  
#line 1 "nopackrat.eyp" 

  my $nxs = $self->YYSymbolStack(0, -1, 'x');
  my $nxr = (unexpendedInput() =~ tr/x//); 
  print "nxs = $nxs nrx = $nxr\n";

  if ($nxs == $nxr+1) { 
    print "Reducing by :MIDx\n";
    $self->YYSetReduce('x', ':MIDx' ) 
  }
  else { $self->YYSetShift('x') } 
#line 161 ./nopackrat.pm
  }

}
#line 165 ./nopackrat.pm
	]
],
#line 168 ./nopackrat.pm
    yybypass       => 0,
    yybuildingtree => 1,
    yyprefix       => '',
    yyaccessors    => {
   },
    yyconflicthandlers => {
          'isInTheMiddle' => {
                               'production' => {
                                                 '-2' => [
                                                           1
                                                         ],
                                                 '-1' => [
                                                           1
                                                         ]
                                               },
                               'line' => 1
                             }
        }
,
    @_,
  );
  bless($self,$class);

  $self->make_node_classes('TERMINAL', '_OPTIONAL', '_STAR_LIST', '_PLUS_LIST', 
         '_SUPERSTART', 
         'S_is_x_S_x', 
         'S_is_x:MIDx', 
         'isInTheMiddle', );
  $self;
}

#line 20 "nopackrat.eyp"


=head1 SYNOPSIS

This grammar is similar to the one in file C<nopackrat.eyp>.
It can't be parsed by LR(k) nor LL(k) algorithms.
Backtracking LR and GLR algorithms can but will perform poorly.

Compile it with:

   $ eyapp -TC nopackratPPCR.eyp

Run it with:

   $ ./nopackratPPCR.pm -t -i -c 'xxx'

=head1 SEE ALSO

Files C<nopackrat.eyp>, C<noLRk_exp.eyp>, C<noLRk_expSolved.eyp>

=cut


#line 224 ./nopackrat.pm

unless (caller) {
  exit !__PACKAGE__->main('');
}


1;
