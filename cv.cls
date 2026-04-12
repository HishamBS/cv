%-------------------------------------------------------------------------------
%                Identification
%-------------------------------------------------------------------------------
% This file is a modified version of russell.cls from:
%   https://github.com/themagicalmammal/Resume
% Original license: LPPL 1.3c
% Modifications by Hisham BinSeddeq — two-column layout, stacked entries,
% full-color section headers, plain-text contact line, semantic color palette.
%-------------------------------------------------------------------------------
\ProvidesClass{cv}[2026/04/12 v2.0 CV Class (derived from russell v1.6.1)]
\NeedsTeXFormat{LaTeX2e}


%-------------------------------------------------------------------------------
%                Class options
%
% (need to be done before the external package loading, for example because
% we need \paperwidth, \paperheight and \@ptsize to be defined before loading
% geometry and fancyhdr)
%-------------------------------------------------------------------------------
% Options for draft or final
\DeclareOption{draft}{\setlength\overfullrule{5pt}}
\DeclareOption{final}{\setlength\overfullrule{0pt}}
% Inherit options of article
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{extarticle}
}
\ProcessOptions\relax
\LoadClass{extarticle}


%-------------------------------------------------------------------------------
%                3rd party packages
%-------------------------------------------------------------------------------
% Needed to make fixed length table
\RequirePackage{array}
% Needed to handle list environment
\RequirePackage{enumitem}
% Needed to handle text alignment
\RequirePackage{ragged2e}
% Needed to configure page layout
\RequirePackage{geometry}
% Needed to make header & footer effeciently
\RequirePackage{fancyhdr}
% Needed to manage colors
\RequirePackage{xcolor}
% Needed to use \ifxetex-\else-\fi statement
\RequirePackage{ifxetex}
% Needed to use \if-\then-\else statement
\RequirePackage{xifthen}
% Needed to use a toolbox of programming tools
\RequirePackage{etoolbox}
% Needed to change line spacing in specific environment
\RequirePackage{setspace}
% Needed to manage fonts
\RequirePackage[quiet]{fontspec}
% To support LaTeX quoting style
\defaultfontfeatures{Ligatures=TeX}
% Needed to manage math fonts
\RequirePackage{unicode-math}
% Needed to use icons from font-awesome
\RequirePackage{fontawesome5}
\RequirePackage{roboto}
\RequirePackage[default,opentype]{sourcesanspro}
% Needed for the photo ID
\RequirePackage[skins]{tcolorbox}
% Needed to deal a paragraphs
\RequirePackage{parskip}
% Needed to deal hyperlink
\RequirePackage[hidelinks,unicode,pdfpagelabels=false]{hyperref}
\hypersetup{%
  pdftitle={},
  pdfauthor={},
  pdfsubject={},
  pdfkeywords={}
}
% Solves issues Warning: File `cv.out' has changed
\RequirePackage{bookmark}
% Needed for \textls* letter spacing on uppercase headers
\RequirePackage{microtype}

%-------------------------------------------------------------------------------
%                Configuration for directory locations
%-------------------------------------------------------------------------------
% Configure an optional directory location for fonts(default: 'fonts/')
% Not required anymore but left in place for backward compatability.
\newcommand*{\fontdir}[1][fonts/]{\def\@fontdir{#1}}

%-------------------------------------------------------------------------------
%                Configuration for layout
%-------------------------------------------------------------------------------
%% Page Layout
% Configure page margins with geometry
\geometry{left=2.0cm, top=1.5cm, right=2.0cm, bottom=2.0cm, footskip=.5cm}

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
\definecolor{darkgray}{HTML}{333333}
\definecolor{gray}{HTML}{5D5D5D}
\definecolor{lightgray}{HTML}{999999}
% Basic colors
\definecolor{green}{HTML}{C2E15F}
\definecolor{orange}{HTML}{FDA333}
\definecolor{purple}{HTML}{D3A4F9}
\definecolor{red}{HTML}{FB4485}
\definecolor{blue}{HTML}{6CE0F1}
% Text colors
\definecolor{darktext}{HTML}{414141}
\colorlet{text}{darkgray}
\colorlet{graytext}{gray}
\colorlet{lighttext}{lightgray}
\colorlet{sectiondivider}{gray}
% russell colors (kept for backward compat but unused in this fork)
\definecolor{russell-emerald}{HTML}{00A388}
\definecolor{russell-skyblue}{HTML}{0395DE}
\definecolor{russell-red}{HTML}{DC3522}
\definecolor{russell-purple}{HTML}{A32CC4}
\definecolor{russell-pink}{HTML}{EF4089}
\definecolor{russell-orange}{HTML}{FF6138}
\definecolor{russell-nephritis}{HTML}{27AE60}
\definecolor{russell-concrete}{HTML}{95A5A6}
\definecolor{russell-darknight}{HTML}{131A28}
\definecolor{russell-black}{HTML}{000000}

% ----- Hisham's semantic palette (target design) -----
\definecolor{cvNameDark}{HTML}{1F2937}     % near-black slate: name, position, entry title
\definecolor{cvBodyDark}{HTML}{111827}     % body text
\definecolor{cvAccent}{HTML}{2563EB}       % modern medium blue: section headers + company names
\definecolor{cvMuted}{HTML}{6B7280}        % contact line, dates, locations, secondary labels
\definecolor{cvRule}{HTML}{D1D5DB}         % thin divider under section headers
\colorlet{russell}{cvAccent}               % any legacy \color{russell} now resolves to the new accent

% Boolean value to switch section color highlighting
\newbool{acvSectionColorHighlight}
\setbool{acvSectionColorHighlight}{true}

% russell section color
\def\@sectioncolor#1#2#3{%
  \ifbool{acvSectionColorHighlight}{{\color{russell}#1#2#3}}{#1#2#3}%
}


%-------------------------------------------------------------------------------
%                Configuration for fonts
%-------------------------------------------------------------------------------
\newcommand*{\headerfont}{\roboto}
\newcommand*{\headerfontlight}{\robotolight}
\newcommand*{\footerfont}{\sourcesanspro}
\newcommand*{\bodyfont}{\sourcesanspro}
\newcommand*{\bodyfontlight}{\sourcesansprolight}

%-------------------------------------------------------------------------------
%                Configuration for styles
%-------------------------------------------------------------------------------
% Configure styles for each CV elements
% For fundamental structures
\newcommand*{\headerfirstnamestyle}[1]{{\fontsize{20pt}{24pt}\headerfont\color{cvNameDark} \MakeUppercase{#1}}}
\newcommand*{\headerlastnamestyle}[1]{{\fontsize{20pt}{24pt}\headerfont\color{cvNameDark} \MakeUppercase{#1}}}
\newcommand*{\headerpositionstyle}[1]{{\fontsize{10.5pt}{13pt}\bodyfont\color{cvNameDark} #1}}
\newcommand*{\headeraddressstyle}[1]{{\fontsize{8pt}{1em}\bodyfont\color{cvMuted} #1}}
\newcommand*{\headersocialstyle}[1]{{\fontsize{8.5pt}{11pt}\bodyfont\color{cvMuted} #1}}
\newcommand*{\headerquotestyle}[1]{{\fontsize{9pt}{12pt}\bodyfont\color{cvBodyDark} #1}}
\newcommand*{\footerstyle}[1]{{\fontsize{8pt}{1em}\footerfont\scshape\color{cvMuted} #1}}
\newcommand*{\sectionstyle}[1]{{%
  \fontsize{11pt}{13pt}\bodyfont\bfseries\color{cvAccent}%
  \textls*[40]{\MakeUppercase{#1}}}%
}
\newcommand*{\subsectionstyle}[1]{{\fontsize{12pt}{1em}\bodyfont\scshape\textcolor{text}{#1}}}
\newcommand*{\paragraphstyle}{\fontsize{9pt}{1em}\bodyfontlight\upshape\color{text}}

% For elements of entry
\newcommand*{\entrytitlestyle}[1]{{\fontsize{10pt}{12pt}\bodyfont\bfseries\color{cvNameDark} #1}}
\newcommand*{\entrypositionstyle}[1]{{\fontsize{8.8pt}{11pt}\bodyfont\color{cvMuted} #1}}
\newcommand*{\entrydatestyle}[1]{{\fontsize{8.5pt}{11pt}\bodyfontlight\color{cvMuted} #1}}
\newcommand*{\entrylocationstyle}[1]{{\fontsize{8.5pt}{11pt}\bodyfontlight\color{cvMuted} #1}}
\newcommand*{\descriptionstyle}[1]{\justifying{\fontsize{9pt}{12pt}\bodyfontlight\upshape\color{cvBodyDark} #1}}

% For elements of skill
\newcommand*{\skilltypestyle}[1]{{\fontsize{9.5pt}{12pt}\bodyfont\bfseries\color{cvNameDark} #1}}
\newcommand*{\skillsetstyle}[1]{{\fontsize{9pt}{12pt}\bodyfontlight\color{cvBodyDark} #1}}


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
% Usage: \name{<firstname>}{<lastname>}
% Usage: \firstname{<firstname>}
% Usage: \lastname{<lastname>}
% Usage: \familyname{<familyname>}
\newcommand*{\name}[2]{\def\@firstname{#1}\def\@lastname{#2}}
\newcommand*{\firstname}[1]{\def\@firstname{#1}}
\newcommand*{\lastname}[1]{\def\@lastname{#1}}
\newcommand*{\familyname}[1]{\def\@lastname{#1}}
\def\@familyname{\@lastname}

% Define writer's address
% Usage: \address{<address>}
\newcommand*{\address}[1]{\def\@address{#1}}

% Define writer's position
% Usage: \position{<position>}
\newcommand*{\position}[1]{\def\@position{#1}}

% Defines writer's mobile (optional)
% Usage: \mobile{<mobile number>}
\newcommand*{\mobile}[1]{\def\@mobile{#1}}

% Defines writer's email (optional)
% Usage: \email{<email address>}
\newcommand*{\email}[1]{\def\@email{#1}}

% Defines writer's date of birth (optional)
% Usage: \dateofbirth{<date>}
\newcommand*{\dateofbirth}[1]{\def\@dateofbirth{#1}}

% Defines writer's homepage (optional)
% Usage: \homepage{<url>}
\newcommand*{\homepage}[1]{\def\@homepage{#1}}

% Defines writer's github (optional)
% Usage: \github{<github-nick>}
\newcommand*{\github}[1]{\def\@github{#1}}

% Defines writer's gitlab (optional)
% Usage: \gitlab{<gitlab-nick>}
\newcommand*{\gitlab}[1]{\def\@gitlab{#1}}

% Defines writer's bitbucket (optional)
% Usage: \bitbucket{<bitbucket-nick>}
\newcommand*{\bitbucket}[1]{\def\@bitbucket{#1}}

% Defines writer's stackoverflow profile (optional)
% Usage: \stackoverflow{<so userid>}{<so username>}
%   e.g.https://stackoverflow.com/users/123456/sam-smith
%       would be \stackoverflow{123456}{sam-smith}
\newcommand*{\stackoverflow}[2]{\def\@stackoverflowid{#1}\def\@stackoverflowname{#2}}

% Defines writer's linked-in (optional)
% Usage: \linkedin{<linked-in-nick>}
\newcommand*{\linkedin}[1]{\def\@linkedin{#1}}

% Defines writer's orcid (optional)
% Usage: \orcid{<orcid-num>}
\newcommand*{\orcid}[1]{\def\@orcid{#1}}

% Defines writer's twitter (optional)
% Usage: \twitter{<twitter handle>}
\newcommand*{\twitter}[1]{\def\@twitter{#1}}

% Defines writer's Mastodon (optional)
% Usage: \mastodon{<instance>}{<mastodon-nick>}
\newcommand*{\mastodon}[2]{\def\@mastodoninstance{#1}\def\@mastodonname{#2}}

% Defines writer's resarchgate (optional)
% Usage: \researchgate{<researchgate-account>}
\newcommand*{\researchgate}[1]{\def\@researchgate{#1}}

% Defines writer's skype (optional)
% Usage: \skype{<skype account>}
\newcommand*{\skype}[1]{\def\@skype{#1}}

% Defines writer's reddit (optional)
% Usage: \reddit{<reddit account>}
\newcommand*{\reddit}[1]{\def\@reddit{#1}}

% Defines writer's xing (optional)
% Usage: \xing{<xing name>}
\newcommand*{\xing}[1]{\def\@xing{#1}}

% Defines writer's medium profile (optional)
% Usage: \medium{<medium account>}
\newcommand*{\medium}[1]{\def\@medium{#1}}

% Defines writer's kaggle (optional)
% Usage: \kaggle{<kaggle handle>}
\newcommand*{\kaggle}[1]{\def\@kaggle{#1}}

% Defines writer's google scholar profile (optional)
% Usage: \googlescholar{<googlescholar userid>}{<googlescholar username>}
% e.g.https://scholar.google.co.uk/citations?user=wpZDx1cAAAAJ
% would be \googlescholar{wpZDx1cAAAAJ}{Name-to-display-next-icon}
% If 'googlescholar-name' is not provided than it defaults to
% '\firstname \lastname'
\newcommand*{\googlescholar}[2]{%
  \def\@googlescholarid{#1}%
  \ifthenelse{\equal{#2}{}}{%
    \def\@googlescholarname{\@firstname~\@lastname}%
  }{%
    \def\@googlescholarname{#2}%
  }%
}

% Defines writer's extra information (optional)
% Usage: \extrainfo{<extra information>}
\newcommand*{\extrainfo}[1]{\def\@extrainfo{#1}}

% Defines writer's quote (optional)
% Usage: \quote{<quote>}
\renewcommand*{\quote}[1]{\def\@quote{#1}}

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
%% Define helper macros a user can change easily
% Header
\newcommand{\acvHeaderNameDelim}{\space}
\newcommand{\acvHeaderAfterNameSkip}{.4mm}
\newcommand{\acvHeaderAfterPositionSkip}{.4mm}
\newcommand{\acvHeaderAfterAddressSkip}{-.5mm}
\newcommand{\acvHeaderIconSep}{\space}
\newcommand{\acvHeaderSocialSep}{\quad\textbar\quad}
\newcommand{\acvHeaderAfterSocialSkip}{6mm}
\newcommand{\acvHeaderAfterQuoteSkip}{5mm}

% Others
\newcommand{\acvSectionTopSkip}{3mm}
\newcommand{\acvSectionContentTopSkip}{2.5mm}


%-------------------------------------------------------------------------------
%                Commands for utilities
%-------------------------------------------------------------------------------
% Use to align an element of tabular table
\newcolumntype{L}[1]{>{\raggedright\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{C}[1]{>{\centering\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{R}[1]{>{\raggedleft\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}

% Use to draw horizontal line with specific thickness
\def\vhrulefill#1{\leavevmode\leaders\hrule\@height#1\hfill \kern\z@}

% Use to execute conditional statements by checking empty string
\newcommand*{\ifempty}[3]{\ifthenelse{\isempty{#1}}{#2}{#3}}


%-------------------------------------------------------------------------------
%                Commands for elements of CV structure
%-------------------------------------------------------------------------------
% Contact line separator — middle dot flanked by thin spaces
\newcommand*{\cvContactSep}{~\textperiodcentered~}

% Assembles a single-line, plain-text contact string from defined fields.
% No FontAwesome icons — matches the target design.
\newcommand*{\makecvcontactline}{%
  \begingroup
  \newbool{cvfirst}\setbool{cvfirst}{true}%
  \ifthenelse{\isundefined{\@address}}{}{%
    \ifbool{cvfirst}{\setbool{cvfirst}{false}}{\cvContactSep}%
    \@address}%
  \ifthenelse{\isundefined{\@mobile}}{}{%
    \ifbool{cvfirst}{\setbool{cvfirst}{false}}{\cvContactSep}%
    \@mobile}%
  \ifthenelse{\isundefined{\@email}}{}{%
    \ifbool{cvfirst}{\setbool{cvfirst}{false}}{\cvContactSep}%
    \href{mailto:\@email}{\@email}}%
  \ifthenelse{\isundefined{\@linkedin}}{}{%
    \ifbool{cvfirst}{\setbool{cvfirst}{false}}{\cvContactSep}%
    \href{https://www.\@linkedin}{\@linkedin}}%
  \ifthenelse{\isundefined{\@github}}{}{%
    \ifbool{cvfirst}{\setbool{cvfirst}{false}}{\cvContactSep}%
    \href{https://\@github}{\@github}}%
  \endgroup
}

% Define a header for CV — uppercase name, title-case position, plain contact line.
% Usage: \makecvheader
% NOTE: first + last name are combined into a single \MakeUppercase call to avoid
%       space-token loss at the boundary between two OpenType-uppercased groups.
% Uses {\centering ...\par} instead of \begin{center}...\end{center} to avoid
% the extra \topsep and \partopsep that the center environment injects.
\newcommand*{\makecvheader}[1][C]{%
  {\centering
    {\fontsize{20pt}{24pt}\headerfont\color{cvNameDark}%
      \MakeUppercase{\@firstname\ \@lastname}}\par
    \vspace{1mm}%
    \ifthenelse{\isundefined{\@position}}{}{%
      \headerpositionstyle{\@position}\par
      \vspace{1mm}%
    }%
    \headersocialstyle{\makecvcontactline}\par%
  }%
}

% Define a footer for CV
% Usage: \makecvfooter{<left>}{<center>}{<right>}
\newcommand*{\makecvfooter}[3]{%
  \fancyfoot{}
  \fancyfoot[L]{\footerstyle{#1}}
  \fancyfoot[C]{\footerstyle{#2}}
  \fancyfoot[R]{\footerstyle{#3}}
}

% Define a section for CV — heading in accent color with a thin gray rule underneath.
% Uses \linewidth (not \textwidth) so the rule adapts to minipage column widths.
% Usage: \cvsection{<section-title>}
\newcommand{\cvsection}[1]{%
  \vspace{\acvSectionTopSkip}%
  \sectionstyle{#1}\par%
  \vspace{0.3mm}%
  {\color{cvRule}\rule{\linewidth}{0.4pt}}\par%
  \phantomsection%
}

% Renders the professional summary as a full-width section block.
% Call between \makecvheader and the two-column body so it spans full page width.
\newcommand*{\makesummarysection}{%
  \ifthenelse{\isundefined{\@quote}}{}{%
    \cvsection{Professional Summary}%
    \par%
    {\headerquotestyle{\justifying\@quote}\par}%
  }%
}

% Helper: renders a company/institution name in accent color, plus optional
% muted-gray location. Designed to be used inside \cventry's #2 argument.
% Usage: {\cvcompany{SCAI / Humain}{Riyadh}}
\newcommand*{\cvcompany}[2]{%
  {\color{cvAccent}\bfseries #1}%
  \ifstrempty{#2}{}{\ {\color{cvMuted}\textbar\ #2}}%
}

% =========================================================================
% Define an environment for cventry (stacked layout — works in any column width)
\newenvironment{cventries}{%
  \vspace{\acvSectionContentTopSkip}
}{%
}
% Define an entry of cv information (stacked layout)
% Renders as:
%   <Title>                                        [entrytitlestyle, bold]
%   <Institution> | <Date>                         [entrypositionstyle / entrydatestyle]
%   <Description>                                  [body text or \begin{cvitems}]
% Usage: \cventry{<title>}{<institution>}{<date>}{<description>}
% Any argument may be empty ({}).
%
% NOTE: \newcommand (not \newcommand*) to allow \par in #4 (for cvitems, etc.).
%       \ifstrempty (from etoolbox) is used instead of \ifempty because it is
%       long-safe, allowing \par tokens in its branches.
\newcommand{\cventry}[4]{%
  \par\vspace{2mm}\noindent
  {\entrytitlestyle{#1}}\par\noindent
  \ifstrempty{#2}{%
    \ifstrempty{#3}{}{{\entrydatestyle{#3}}\par}%
  }{%
    {\entrypositionstyle{#2}}%
    \ifstrempty{#3}{}{\ {\entrydatestyle{\textbar\ #3}}}%
    \par
  }%
  \ifstrempty{#4}{}{\vspace{0.5mm}#4\par}%
}


% =========================================================================
% Define an environment for cvskill (inline paragraph style — narrow-column friendly)
\newenvironment{cvskills}{%
  \vspace{\acvSectionContentTopSkip}
  \begin{justify}
  \setlength{\parskip}{1mm}
}{%
  \end{justify}
}
% Define a line of cv information(skill) — inline "Category: list" format
% Explicit \hspace is used instead of \ because inter-group control spaces
% between two font-changing groups occasionally get eaten.
% Usage: \cvskill{<type>}{<skillset>}
\newcommand*{\cvskill}[2]{%
  {\skilltypestyle{#1:}}\hspace{0.35em}{\skillsetstyle{#2}}\par
}

% =========================================================================
% Define an environment for cvitems(for cventry)
% Tight but readable bullet spacing (fits on 1 page while still breathable)
\newenvironment{cvitems}{%
  \vspace{-1mm}%
  \begin{justify}%
  \begin{itemize}[leftmargin=2.2ex, topsep=0.4mm, partopsep=0pt, itemsep=0.3mm, parsep=0pt]%
    \setlength{\parskip}{0pt}%
    \renewcommand{\labelitemi}{\textbullet}%
}{%
  \end{itemize}%
  \end{justify}%
  \vspace{-0.8mm}%
}