%% Start of file `clean-cv.cls'.
% Clean CV Class File
%
% This class has been downloaded from:
% https://github.com/0xc0d3d00d/cv
%
% Author:
% Mohammad Hossein Heidari <mdh.heydari@gmail.com>
%
% Notes:
% 1) This class file defines the structure and layout of the template file (cv.tex, resume.tex).
% 2) It has been written in such a way that under most circumstances you
% should not need to edit it.
%
% Class license:
% LPPL v1.3c (http://www.latex-project.org/lppl)
%


%-------------------------------------------------------------------------------
%                Identification
%-------------------------------------------------------------------------------

\ProvidesClass{clean-cv}[2019/12/14 v1.0.0 Clean Curriculum Vitae Class]
\NeedsTeXFormat{LaTeX2e}

%-------------------------------------------------------------------------------
%                Class options
%
% (need to be done before the external package loading, for example because
% we need \paperwidth, \paperheight and \@ptsize to be defined before loading
% geometry and fancyhdr)
%-------------------------------------------------------------------------------

\LoadClass{article}

%-------------------------------------------------------------------------------
%                3rd party packages
%-------------------------------------------------------------------------------

% Needed to make fixed length table
\RequirePackage{array}
% Needed to configure page layout
\RequirePackage{geometry}
% Needed to manage fonts
\RequirePackage[quiet]{fontspec}
% Needed to handle list environment
\RequirePackage{enumitem}
% Needed to handle text alignment
\RequirePackage{ragged2e}
% To support LaTeX quoting style
\defaultfontfeatures{Ligatures=TeX}
% Needed to manage math fonts
\RequirePackage{unicode-math}
% Needed to use icons from font-awesome
% (https://github.com/posquit0/latex-fontawesome)
\RequirePackage{fontawesome}
\RequirePackage[default,opentype]{sourcesanspro}
% Needed to make header & footer effeciently
\RequirePackage{fancyhdr}
% Needed to manage colors
\RequirePackage{xcolor}
% Needed to use \if-\then-\else statement
\RequirePackage{xifthen}
% Needed to use a toolbox of programming tools
\RequirePackage{etoolbox}
% Needed to change line spacing in specific environment
\RequirePackage{setspace}
% Needed for the photo ID
\RequirePackage[skins]{tcolorbox}
% Needed to deal a paragraphs
\RequirePackage{parskip}
% Needed to create social box
\RequirePackage{tcolorbox}
\tcbuselibrary{raster}
\RequirePackage{tabularx}
% Needed to deal hyperlink
\RequirePackage[hidelinks,unicode]{hyperref}
\hypersetup{%
  pdftitle={},
  pdfauthor={},
  pdfsubject={},
  pdfkeywords={}
}


%-------------------------------------------------------------------------------
%                Configuration for directory locations
%-------------------------------------------------------------------------------
% Configure a directory location for fonts(default: 'fonts/')
\newcommand*{\fontdir}[1][fonts/]{\def\@fontdir{#1}}
\fontdir

%-------------------------------------------------------------------------------
%                Configuration for layout
%-------------------------------------------------------------------------------
%% Page Layout
% Configure page margins with geometry
\geometry{left=.3cm, top=1.5cm, right=.3cm, bottom=2.0cm, footskip=.5cm}

%% Header & Footer
% Set offset to each header and footer
\fancyhfoffset{0em}
% Remove head rule
\renewcommand{\headrulewidth}{0pt}
% Clear all header & footer fields
\fancyhf{}
% Enable if you want to make header or footer using fancyhdr
\pagestyle{fancy}

%-------------------------------------------------------------------------------
%                Configuration for colors
%-------------------------------------------------------------------------------
% Gray-scale colors
\definecolor{white}{HTML}{FFFFFF}
\definecolor{black}{HTML}{000000}
\definecolor{jetblack}{HTML}{050002}
\definecolor{darkgray}{HTML}{333333}
\definecolor{gray}{HTML}{5D5D5D}
\definecolor{lightgray}{HTML}{999999}
\definecolor{verylightgray}{HTML}{D3D3D3}

% Basic colors
\definecolor{green}{HTML}{C2E15F}
\definecolor{orange}{HTML}{FDA333}
\definecolor{purple}{HTML}{D3A4F9}
\definecolor{red}{HTML}{FB4485}
\definecolor{blue}{HTML}{6CE0F1}
% Text colors
\colorlet{blacktext}{jetblack}
\definecolor{darktext}{HTML}{414141}
\colorlet{text}{darkgray}
\colorlet{graytext}{gray}
\colorlet{lighttext}{lightgray}
% Awesome colors
\definecolor{awesome-emerald}{HTML}{00A388}
\definecolor{awesome-skyblue}{HTML}{0395DE}
\definecolor{awesome-red}{HTML}{DC3522}
\definecolor{awesome-pink}{HTML}{EF4089}
\definecolor{awesome-orange}{HTML}{FF6138}
\definecolor{awesome-nephritis}{HTML}{27AE60}
\definecolor{awesome-concrete}{HTML}{95A5A6}
\definecolor{awesome-darknight}{HTML}{131A28}
\colorlet{awesome}{awesome-red}

% Boolean value to switch section color highlighting
\newbool{cleanCvSectionColorHighlight}
\setbool{cleanCvSectionColorHighlight}{true}

% Awesome section color
\def\@sectioncolor#1#2#3{%
  \ifbool{cleanCvSectionColorHighlight}{{\color{awesome}#1#2#3}}{#1#2#3}%
}

%-------------------------------------------------------------------------------
%                Configuration for fonts
%-------------------------------------------------------------------------------
% Set the FontAwesome font to be up-to-date.
%\newfontfamily\FA[Path=\@fontdir]{FontAwesome}
% Set font for header (default is Roboto)
\newfontfamily\headerfont[
  Path=\@fontdir,
  UprightFont=*-R,
  ItalicFont=*-RI,
  BoldFont=*-B,
  BoldItalicFont=*-BI,
]{Ubuntu}

\newfontfamily\headerfontlight[
  Path=\@fontdir,
  UprightFont=*-L,
  ItalicFont=*-LI,
  BoldFont=*-M,
  BoldItalicFont=*-MI,
]{Ubuntu}

\newcommand*{\footerfont}{\sourcesanspro}
\newcommand*{\bodyfont}{\headerfont}
\newcommand*{\bodyfontlight}{\headerfontlight}


%-------------------------------------------------------------------------------
%                Configuration for styles
%-------------------------------------------------------------------------------
% Configure styles for each CV elements
% For fundamental structures
\newcommand*{\headernamestyle}[1]{{\fontsize{24pt}{1em}\headerfontlight\bfseries\color{blacktext} #1}}
\newcommand*{\headerpositionstyle}[1]{{\fontsize{12pt}{1.6em}\bodyfont\color{gray} #1}}
\newcommand*{\headerheadlinestyle}[1]{{\fontsize{9pt}{1.6em}\bodyfont\color{blacktext} #1}}
\newcommand*{\headeraddressstyle}[1]{{\fontsize{9pt}{1em}\headerfont\itshape\color{lighttext} #1}}
\newcommand*{\headersocialstyle}[1]{{\fontsize{10pt}{2em}\headerfont\color{text} #1}}
\newcommand*{\headericonstyle}[1]{{\fontsize{9pt}{2em}\headerfont\color{text}\@sectioncolor #1}}
\newcommand*{\footerstyle}[1]{{\fontsize{8pt}{1em}\footerfont\scshape\color{lighttext} #1}}
\newcommand*{\sectionstyle}[1]{{\fontsize{16pt}{1em}\bodyfont\bfseries\color{text}\@sectioncolor #1}}
\newcommand*{\subsectionstyle}[1]{{\fontsize{12pt}{1em}\bodyfont\scshape\textcolor{text}{#1}}}
\newcommand*{\paragraphstyle}{\fontsize{9pt}{1em}\bodyfontlight\upshape\color{text}}

% For elements of entry
\newcommand*{\entryorganizationstyle}[1]{{\fontsize{12pt}{0.5em}\bodyfont\color{blacktext} #1}}
\newcommand*{\entryorganizationdescriptionstyle}[1]{{\fontsize{8pt}{0.5em}\bodyfont\slshape\color{graytext} #1}}
\newcommand*{\entrypositionstyle}[1]{{\fontsize{12pt}{0.5em}\bodyfont\bfseries\color{blacktext} #1}}
\newcommand*{\entrydatestyle}[1]{{\fontsize{8pt}{0.5em}\bodyfontlight\slshape\color{graytext} #1}}
\newcommand*{\entrylocationstyle}[1]{{\fontsize{8pt}{0.5em}\bodyfontlight\slshape\color{graytext} #1}}
\newcommand*{\descriptionstyle}[1]{{\fontsize{10pt}{0.5em}\bodyfontlight\upshape\color{text} #1}}


%-------------------------------------------------------------------------------
%                No margin environment definition
%-------------------------------------------------------------------------------

\newenvironment{nomargin}{%
\begin{list}{}{%
\setlength{\topsep}{0pt}%
\setlength{\leftmargin}{-0.6cm}%
\setlength{\rightmargin}{-0.6cm}%
\setlength{\listparindent}{\parindent}%
\setlength{\itemindent}{\parindent}%
\setlength{\parsep}{\parskip}%
}%
\item[]}{\end{list}}

%-------------------------------------------------------------------------------
%                Commands for personal information
%-------------------------------------------------------------------------------
% Define photo ID
% Usage: \photo[circle|rectangle,edge|noedge,left|right]{<path-to-image>}
\newcommand{\photo}[2][circle,edge,left]{%
  \def\@photo{#2}
  \@for\tmp:=#1\do{%
    \ifthenelse{\equal{\tmp}{circle} \or \equal{\tmp}{rectangle}}%
      {\let\@photoshape\tmp}{}%
    \ifthenelse{\equal{\tmp}{edge} \or \equal{\tmp}{noedge}}%
      {\let\@photoedge\tmp}{}%
    \ifthenelse{\equal{\tmp}{left} \or \equal{\tmp}{right}}%
      {\let\@photoalign\tmp}{}%
  }%
}
\def\@photoshape{circle}
\def\@photoedge{edge}
\def\@photoalign{left}

% Define writer's name
% Usage: \name{<name>}
\newcommand*{\name}[1]{\def\@name{#1}}

% Define writer's headline
% Usage: \headline{<headline>}
\newcommand*{\headline}[1]{\def\@headline{#1}}

% Define writer's address
% Usage: \address{<address>}
\newcommand*{\address}[1]{\def\@address{#1}}

% Define writer's position
% Usage: \name{<position>}
\newcommand*{\position}[1]{\def\@position{#1}}

% Defines writer's mobile (optional)
% Usage: \mobile{<mobile number>}
\newcommand*{\mobile}[1]{\def\@mobile{#1}}

% Defines writer's location (optional)
% Usage: \location{<location>}
\newcommand*{\location}[1]{\def\@location{#1}}

% Defines writer's email (optional)
% Usage: \email{<email adress>}
\newcommand*{\email}[1]{\def\@email{#1}}

% Defines writer's homepage (optional)
% Usage: \homepage{<url>}
\newcommand*{\homepage}[1]{\def\@homepage{#1}}

% Defines writer's github (optional)
% Usage: \github{<github-nick>}
\newcommand*{\github}[1]{\def\@github{#1}}

% Defines writer's gitlab (optional)
% Usage: \gitlab{<gitlab-nick>}
\newcommand*{\gitlab}[1]{\def\@gitlab{#1}}

% Defines writer's stackoverflow profile (optional)
% Usage: \stackoverflow{<so userid>}{<so username>}
%   e.g.https://stackoverflow.com/users/123456/sam-smith
%       would be \stackoverflow{123456}{sam-smith}
\newcommand*{\stackoverflow}[2]{\def\@stackoverflowid{#1}\def\@stackoverflowname{#2}}

% Defines writer's linked-in (optional)
% Usage: \linkedin{<linked-in-nick>}
\newcommand*{\linkedin}[1]{\def\@linkedin{#1}}

% Usage: \twitter{<twitter handle>}
\newcommand*{\twitter}[1]{\def\@twitter{#1}}

% Defines writer's skype (optional)
% Usage: \skype{<skype account>}
\newcommand*{\skype}[1]{\def\@skype{#1}}

% Defines writer's reddit (optional)
% Usage: \reddit{<reddit account>}
\newcommand*{\reddit}[1]{\def\@reddit{#1}}

% Defines writer's xing (optional)
% Usage: \xing{<xing name>}
\newcommand*{\xing}[1]{\def\@xing{#1}}

% Defines writer's twitter (optional)
% Defines writer's extra informations (optional)
% Usage: \extrainfo{<extra informations>}
\newcommand*{\extrainfo}[1]{\def\@extrainfo{#1}}

% Defines recipient's information (cover letter only)
% Usage: \recipient{<recipient name>}{<recipient address>}
% Usage: \recipientname{<recipient name>}
% Usage: \recipientaddress{<recipient address>}
\newcommand*{\recipient}[2]{\def\@recipientname{#1}\def\@recipientaddress{#2}}
\newcommand*{\recipientname}[1]{\def\@recipientname{#1}}
\newcommand*{\recipientaddress}[1]{\def\@recipientaddress{#1}}

% Defines the title for letter (cover letter only, optional)
% Usage: \lettertitle{<title>}
\newcommand*{\lettertitle}[1]{\def\@lettertitle{#1}}

% Defines the date for letter (cover letter only)
% Usage: \letterdate{<date>}
\newcommand*{\letterdate}[1]{\def\@letterdate{#1}}

% Defines a message of opening for letter (cover letter only)
% Usage: \letteropening{<message>}
\newcommand*{\letteropening}[1]{\def\@letteropening{#1}}

% Defines a message of closing for letter (cover letter only)
% Usage: \letterclosing{<message>}
\newcommand*{\letterclosing}[1]{\def\@letterclosing{#1}}

% Defines an enclosure for letter (cover letter only, optional)
% Usage: \letterenclosure[<enclosure name>]{<enclosure>}
\newcommand*{\letterenclname}[1][Enclosure]{\def\@letterenclname{#1}}
\newcommand*{\letterenclosure}[2][]{%
  % if an optional argument is provided, use it to redefine \enclname
  \ifthenelse{\equal{#1}{}}{}{\def\@letterenclname{#1}}
  \def\@letterenclosure{#2}
}

%-------------------------------------------------------------------------------
%                Commands for extra
%-------------------------------------------------------------------------------
% Helpers
\newcommand\modulo[2]{\@tempcnta=#1
        \divide\@tempcnta by #2
        \multiply\@tempcnta by #2
        \multiply\@tempcnta by -1
        \advance\@tempcnta by #1\relax
        \the\@tempcnta}

%% Define helper macros a user can change easily
% Header
\newcommand{\cleanCvHeaderNameDelim}{\space}
\newcommand{\cleanCvHeaderAfterNameSkip}{.4mm}
\newcommand{\cleanCvHeaderAfterPositionSkip}{.4mm}
\newcommand{\cleanCvHeaderAfterHeadlineSkip}{-.5mm}
\newcommand{\cleanCvHeaderIconSep}{\space\space}
\newcommand{\cleanCvHeaderSocialSep}{\quad\textbar\quad}
\newcommand{\cleanCvHeaderAfterSocialSkip}{6mm}
\newcommand{\cleanCvHeaderAfterQuoteSkip}{5mm}

% Others
\newcommand{\cleanCvSectionTopSkip}{4mm}
\newcommand{\cleanCvSectionContentTopSkip}{2.5mm}


%-------------------------------------------------------------------------------
%                Commands for elements of CV structure
%-------------------------------------------------------------------------------
% Define a header for CV
% Usage: \makecvheader
\newcommand*{\makecvheader}[1][L]{%
  \newcommand*{\drawphoto}{%
    \ifthenelse{\isundefined{\@photo}}{}{%
      \newlength{\photodim}
      \ifthenelse{\equal{\@photoshape}{circle}}%
        {\setlength{\photodim}{1.1cm}}%
        {\setlength{\photodim}{1.1cm}}%
      \ifthenelse{\equal{\@photoedge}{edge}}%
        {\def\@photoborder{verylightgray}}%
        {\def\@photoborder{none}}%
      \begin{tikzpicture}%
        \node[\@photoshape, draw=\@photoborder, line width=0.3mm, inner sep=\photodim, fill overzoom image=\@photo] () {};
      \end{tikzpicture}
    }%
  }
  \newlength{\headertextwidth}
  \newlength{\headerphotowidth}
  \ifthenelse{\isundefined{\@photo}}{
    \setlength{\headertextwidth}{\textwidth}
    \setlength{\headerphotowidth}{0cm}
  }{%
    \setlength{\headertextwidth}{0.82\textwidth}
    \setlength{\headerphotowidth}{0.18\textwidth}
  }%
  \begin{minipage}[c]{\headerphotowidth}%
    \ifthenelse{\equal{\@photoalign}{left}}{\raggedright\drawphoto}{}
  \end{minipage}
  \begin{minipage}[c]{\headertextwidth}
    \ifthenelse{\equal{#1}{C}}{\centering}{\ifthenelse{\equal{#1}{R}}{\raggedleft}{\raggedright}}
    \headernamestyle{\@name}%
    \\[\cleanCvHeaderAfterNameSkip]%
    \ifthenelse{\isundefined{\@position}}{}{\headerpositionstyle{\@position\\[\cleanCvHeaderAfterPositionSkip]}}%
    \ifthenelse{\isundefined{\@headline}}{}{\headerheadlinestyle{\@headline\\[\cleanCvHeaderAfterHeadlineSkip]}}%
  \end{minipage}%
  %\begin{minipage}[c]{\headerphotowidth}%
  %  \ifthenelse{\equal{\@photoalign}{right}}{\raggedleft\drawphoto}{}
  %\end{minipage}
  \begin{nomargin}
  \begin{tcolorbox}[arc=0pt,boxrule=0pt,colframe=verylightgray,colback=verylightgray,height=8em]
  \headersocialstyle{%
      \noindent\begin{tabularx}{\textwidth}{>{\raggedright\arraybackslash}X >{\raggedright\arraybackslash}X >{\raggedright\arraybackslash}X}
      \ifthenelse{\isundefined{\@mobile}}%
        {}%
        {%
          \faMobile\cleanCvHeaderIconSep\@mobile &%
        }%
      \ifthenelse{\isundefined{\@location}}%
        {}%
        {%
          \faMapMarker\cleanCvHeaderIconSep\@location &%
        }%
      \ifthenelse{\isundefined{\@email}}%
        {}%
        {%
          \href{mailto:\@email}{\faEnvelope\cleanCvHeaderIconSep\@email} &
        }%
      \ifthenelse{\isundefined{\@homepage}}%
        {}%
        {%
          \href{http://\@homepage}{\faHome\cleanCvHeaderIconSep\@homepage} &
        }%
      \ifthenelse{\isundefined{\@github}}%
        {}%
        {%
          \href{https://github.com/\@github}{\faGithubSquare\cleanCvHeaderIconSep\@github} &
        }%
      \ifthenelse{\isundefined{\@gitlab}}%
        {}%
        {%
          \href{https://gitlab.com/\@gitlab}{\faGitlab\cleanCvHeaderIconSep\@gitlab} & 
        }%
      \ifthenelse{\isundefined{\@stackoverflowid}}%
        {}%
        {%
          \href{https://stackoverflow.com/users/\@stackoverflowid}{\faStackOverflow\cleanCvHeaderIconSep\@stackoverflowname} &
        }%
      \ifthenelse{\isundefined{\@linkedin}}%
        {}%
        {%
          \href{https://www.linkedin.com/in/\@linkedin}{\faLinkedinSquare\cleanCvHeaderIconSep\@linkedin} &
        }%
      \ifthenelse{\isundefined{\@twitter}}%
        {}%
        {%
          \href{https://twitter.com/\@twitter}{\faTwitter\cleanCvHeaderIconSep\@twitter} &
        }%
      \ifthenelse{\isundefined{\@skype}}%
        {}%
        {%
          \faSkype\cleanCvHeaderIconSep\@skype &
        }%
      \ifthenelse{\isundefined{\@reddit}}%
        {}%
        {%
          \href{https://www.reddit.com/user/\@reddit}{\faReddit\cleanCvHeaderIconSep\@reddit} &
        }%
      \ifthenelse{\isundefined{\@xing}}%
        {}%
        {%
          \href{https://www.xing.com/profile/\@xing}{\faXingSquare\cleanCvHeaderIconSep\@xing} &
        }%
      \ifthenelse{\isundefined{\@extrainfo}}%
        {}%
        {%
          \@extrainfo%
        }%
    \end{tabularx}
    } \\[\cleanCvHeaderAfterSocialSkip]%
    \end{tcolorbox}
    \end{nomargin}
}

% Define a footer for CV
% Usage: \makecvfooter{<left>}{<center>}{<right>}
\newcommand*{\makecvfooter}[3]{%
  \fancyfoot{}
  \fancyfoot[L]{\footerstyle{#1}}
  \fancyfoot[C]{\footerstyle{#2}}
  \fancyfoot[R]{\footerstyle{#3}}
}

% Define a section for CV
% Usage: \cvsection{<section-title>}
\newcommand{\cvsection}[1]{%
  \vspace{\cleanCvSectionTopSkip}
  \sectionstyle{#1}
  \phantomsection
  \color{gray}
  \vspace{-2.0mm}
}

% Define an environment for cvskill
\newenvironment{cvskills}{%
  \vspace{\cleanCvSectionContentTopSkip}
  \newline
  \begin{raggedright}
}{%
  \end{raggedright}
  \newline
}
% Define a line of cv information(skill)
% Usage: \cvskill{<skill>}
\newcommand*{\cvskill}[1]{%
    \setbox0=\hbox{#1}
    \setlength{\@tempdima}{\dimexpr\wd0+13pt}
    \begin{tcolorbox}[before={\relax},after={\relax},left=6pt,right=6pt,top=6pt,bottom=6pt,boxrule=0.5pt,arc=4pt,height=2em,boxsep=0pt,colframe=awesome,colback=awesome,width=\@tempdima]
        \color{white}#1
    \end{tcolorbox}
}

% Define an entry of cv information
% Usage: \cventry{<position>}{<organization>}{<organization_description>}{<location>}{<date>}{<description>}
\newcommand*{\cventry}[6]{%
  \vspace{2.0mm}
  \setlength\tabcolsep{0pt}
  \setlength{\extrarowheight}{0pt}
  \renewcommand{\arraystretch}{0.6}
  \begin{tabularx}{\textwidth}{>{\raggedright\arraybackslash}X >{\raggedleft\arraybackslash}X}
    \entrypositionstyle{#1} & \\
    \entryorganizationstyle{#2} & \\
    \entrydatestyle{#5} & \entrylocationstyle{#4} \\
    \entryorganizationdescriptionstyle{#3} & \\
  \end{tabularx}
  \begin{raggedright}
  \descriptionstyle{#6}
  \end{raggedright}
  %\begin{tabular*}{\textwidth}{@{\extracolsep{\fill}} L{\textwidth - 4.5cm} R{4.5cm}}
  %  \ifempty{#2#3}
  %    {\entrypositionstyle{#1} & \entrydatestyle{#4} \\}
  %    {\entrytitlestyle{#2} & \entrylocationstyle{#3} \\
  %    \entrypositionstyle{#1} & \entrydatestyle{#4} \\}
  %  \multicolumn{2}{L{\textwidth}}{\descriptionstyle{#5}}
  %\end{tabular*}%
}

% Define an environment for cventry
\newenvironment{cventries}{%
  \vspace{\cleanCvSectionContentTopSkip}
  \begin{center}
}{%
  \end{center}
}

% Define an entry of publication information
% Usage: \pubentry{<title>}{<booktitle>}{<publisher>}{<year>}{<authors>}{<description>}
\newcommand*{\pubentry}[6]{
  \vspace{2.0mm}
  \begin{minipage}[c]{0.49\textwidth}
    \entrypositionstyle{#1} \\
    \entryorganizationstyle{#2} \\
    \entrydatestyle{#3} - \entrylocationstyle{#4} \\
    \entryorganizationdescriptionstyle{#5} \\
    \descriptionstyle{#6}
  \end{minipage}%
  \hspace{0.02\textwidth}
}

% Define an environment for pubentry
\newenvironment{pubentries}{%
  \vspace{\cleanCvSectionContentTopSkip}
}{%
}

% Define an environment for cvitems(for cventry)
\newenvironment{cvitems}{%
  \begin{justify}
  \begin{itemize}[leftmargin=2ex, nosep, noitemsep]
    \setlength{\parskip}{0pt}
    \renewcommand{\labelitemi}{\bullet}
}{%
  \end{itemize}
  \end{justify}
  \vspace{-4.0mm}
}


