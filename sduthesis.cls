% !Mode:: "TeX:UTF-8"
\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{sduthesis}[2015/05/12 v1.0.5 Shandong University Thesis Template for Postgraduate]
%------解决表格换行问题-------
\newcommand{\tabincell}[2]{\begin{tabular}{@{}#1@{}}#2\end{tabular}}  
%------解决表格换行问题-------

% ----- KVoptions Packages -----
\RequirePackage{kvoptions}
\RequirePackage{etoolbox}
\SetupKeyvalOptions{family=SDU, prefix=SDU@opt@, setkeys=\kvsetkeys}
\newcommand{\ekv}[1]{\kvsetkeys{SDU}{#1}}

% ----- Declare Options -----
% ----- CHSstyle
\DeclareBoolOption[true]{chsstyle}
\DeclareComplementaryOption{nochsstyle}{chsstyle}
% ----- draft/print
\DeclareBoolOption[false]{print}
\DeclareComplementaryOption{noprint}{print}
% ----- double/single
\DeclareBoolOption[true]{double}
\DeclareComplementaryOption{single}{double}
% ----- Default Options
\DeclareDefaultOption{\PassOptionsToPackage{\CurrentOption}{ctexbook}}
% A4纸张大小，书记格式
%\LoadClass[a4paper, 12pt]{book}
\LoadClass[a4paper,UTF8, 12pt, openany]{book}
\ProcessKeyvalOptions*\relax

\ifSDU@opt@double\relax\else
	\PassOptionsToClass{openany}{book}
\fi
%------print------

%------中文支持------
\RequirePackage[ noindent, scheme=plain, UTF8, heading]{ctex}
%----字体名
%\RequirePackage{ifpdf,ifxetex}
%\ifpdf
%	\newcommand{\fzbHei}{\heiti}
%\else
%	\newcommand{\fzbHei}{\heiti}
%\fi
%------中文支持------

%%%%%%%%%%%%%%%%%%%%%%%%页面设置%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
\ifSDU@opt@double
%\newcommand{\GeoOptions}{left=3.75cm, right=2.75cm, top=3cm, bottom=3cm}
\newcommand{\GeoOptions}{left=2.5cm, right=2.5cm, top=2.8cm, bottom=2.5cm,headheight=2cm,headsep=0.8cm,footskip=1.44cm}
\else
\newcommand{\GeoOptions}{left=2.5cm, right=2.5cm, top=2.8cm, bottom=2.5cm,headheight=2cm,headsep=0.8cm,footskip=1.44cm}
\fi
%\newcommand{\GeoOptions}{left=2.75cm, right=2.75cm, top=3cm, bottom=3cm}
%\fi
\RequirePackage[\GeoOptions]{geometry}
%------页面设置------
%------行距------
\linespread{1.3}
\addtolength{\parskip}{.3ex}
%------行距------
%%%%%%%%%%%%%%%%%%%%%页眉页脚%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{fancyhdr}
%----清除设置----
\pagestyle{fancyplain}
\fancyhf{}
%----清除设置----

%----页眉划线----
\renewcommand{\headrule}{%
	\hrule\@height1.5pt\@width\headwidth%
	\vskip1pt%
	\hrule\@height\headrulewidth\@width\headwidth%
}
%----眉脚内容----
% ----------页眉----------
\pagestyle{fancy}
%\fancyhf{}
%\makeatletter
\ifSDU@opt@chsstyle
\chead{\zihao{5}\the\ThesisHeader}% 山东大学硕士学位论文
\else
\chead{\small \the\EThesisHeader}
\fi
%\makeatother
% ----------页脚----------
\cfoot{{~\thepage~}}  % 页码居中显示,不加--
%\fancyfoot[LE,RO]{--{~\thepage~}--}   % 页码居外侧显示
%----眉脚内容----
%------页眉页脚------

%%%%%%%%%%%%%%%%%%%%%%%%%%%%数学支持%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amsthm}
\RequirePackage{amssymb}
\RequirePackage{amsbsy}
\RequirePackage{bm}
\RequirePackage{mathrsfs}
\newcommand*{\me}{\ensuremath{\mathrm{e}}}				%自然对数的底
\newcommand*{\mi}{\ensuremath{\mathrm{i}}}				%虚数单位
\newcommand*{\dif}{\ensuremath{\,\mathrm{d}}}			%微分算子
\DeclareMathAlphabet{\mathsfsl}{OT1}{cmss}{m}{sl}
\newcommand*{\VEC}[1]{\ensuremath{\boldsymbol{#1}}}		%向量
\newcommand*{\MATRIX}[1]{\ensuremath{\mathsfsl{#1}}}	%矩阵名称
\newcommand*{\TENSOR}[1]{\ensuremath{\mathsfsl{#1}}}	%张量名称
\newcommand*{\HUA}[1]{\ensuremath{\mathscr{{#1}}}} 		%输出花体字母
\newcommand*{\SHUANG}[1]{\ensuremath{\mathbb{{#1}}}}	%输出双线字母
\numberwithin{equation}{chapter}						%公式编号随section变化
%------数学支持------

%%%%%%%%%%%%%%%%%%%%%%%%%%图表支持%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{graphicx}
%----图档搜索路径----
\graphicspath{{figures/}{figure/}{pictures/}{picture/}{pic/}{pics/}{image/}{images/}}
%----图档搜索路径----
\RequirePackage{booktabs}
%%----表格行距----
\renewcommand\arraystretch{1.3}
%-----算法行距----
\RequirePackage[ruled,linesnumbered]{algorithm2e}
\SetAlFnt{\linespread{1.3}\normalfont} % 将行距设置为1.5倍
%%----表格行距----
%----编号----
\RequirePackage{amsmath}
\numberwithin{figure}{chapter}
\numberwithin{table}{chapter}
\renewcommand\theequation{\arabic{chapter}-\arabic{equation}}
\renewcommand {\thetable} {\thechapter{}-\arabic{table}}
\renewcommand {\thefigure} {\thechapter{}-\arabic{figure}}
%----编号----
%----不浮动----
\makeatletter
\newcommand{\figcaption}{\def\@captype{figure}\caption}
\newcommand{\tabcaption}{\def\@captype{table}\caption}
\makeatother
\RequirePackage{caption}
\captionsetup[figure]{font={small}, labelsep=space, skip=6pt, position=bottom}
\captionsetup[table]{font={small}, labelsep=space, skip=6pt, position=top}
%----不浮动----
%------图表支持------

%%%%%%%%%%%%%%%%%%%%%%%%%%%交叉引用%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{hyperref}
\hypersetup{unicode}
\hypersetup{colorlinks=true}
\hypersetup{linkcolor=black}
\makeatletter
\ifSDU@opt@print
	\hypersetup{allcolors=black}
\else\relax\fi
\makeatother
%------交叉引用------


%%%%%%%%%%%%%%%%%%%%%%%%%中文摘要%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand\cnabstractname{摘\quad{}要}
\newcommand\cnkeywordsname{关键词}
\newcommand\cnkeywords[1]{%
	%	\vspace{1cm}%
	\begingroup
	\setlength\parskip{0pt}% 段前段后间距为0
	\setlength\parindent{0pt}% 无缩进
	%	\singlespacing% 单倍行距（假设您已经使用了 setspace 宏包）
	\setlength\baselineskip{20pt}% 固定值20磅行距
	\justifying\songti% 使用宋体
	\zihao{-4}% 小四号
	\noindent% 无缩进
	{\heiti\zihao{-4}\cnkeywordsname：}% 使用黑体（替换原来的 \bfseries），并保留原有的字号和标签
	#1% 关键词加粗
	\endgroup% 结束局部组，恢复先前的格式设置
}
%其后关键词用全角分号分隔，中文字体为宋体，小四号，两端对齐，无缩进，段前0行，段后0行，固定值20磅。
\newenvironment{cnabstract}{%
	\newpage
	\phantomsection
	\vspace*{24pt}% 新增：设置标题段前间距为24pt
	\centerline{\noindent\zihao{-3}\bfseries\heiti\cnabstractname}\vspace{18pt}% 修改：设置段后间距为18pt
	\addcontentsline{toc}{chapter}{摘\quad{}要} %使目录中以章级别显示“摘要”
	\addcontentsline{toe}{chapter}{Chinese Abstract}
	\setlength{\parindent}{2em}% 新增：设置首行缩进为2字符
	\setlength{\parskip}{0pt}% 新增：设置段前段后间距为0
	%		\linespread{1}% 新增：设置正文单倍行距
	%		\zihao{-4}% 修改：删除这一行，因为不需要在这里设置字号
	\justifying\songti\zihao{-4}\setlength{\baselineskip}{20pt}\selectfont
}{%
	\clearpage
}
%---------- 中文摘要--------------

%%%%%%%%%%%%%%%%%%%%%%%%%英文摘要%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand\enabstractname{ABSTRACT}
\newcommand\enkeywordsname{Key words}
\newcommand\enkeywords[1]{%
	%	\vspace{1cm}%
	\begingroup
	\setlength\parskip{0pt}% 段前段后间距为0
	\setlength\parindent{0pt}% 无缩进
	%	\singlespacing% 单倍行距（假设您已经使用了 setspace 宏包）
	\setlength\baselineskip{20pt}% 固定值20磅行距
	\justifying\zihao{-4}% 小四号
	\noindent% 无缩进
	{\bfseries\zihao{-4}\enkeywordsname：}% 使用黑体（替换原来的 \bfseries），并保留原有的字号和标签
	#1% 关键词加粗
	\endgroup% 结束局部组，恢复先前的格式设置
}
\newenvironment{enabstract}{%
	\newpage
	\phantomsection
	\vspace*{24pt}% 新增：设置标题段前间距为24pt
	\centerline{\noindent\zihao{-3}\bfseries\enabstractname}\vspace{18pt}% 修改：设置段后间距为18pt
	\addcontentsline{toc}{chapter}{ABSTRACT}
	\addcontentsline{toe}{chapter}{English Abstract}
	\setlength{\parindent}{1.2em}% 新增：设置首行缩进为2字符
	\setlength{\parskip}{0pt}% 新增：设置段前段后间距为0
	%		\linespread{1}% 新增：设置正文单倍行距
	%		\zihao{-4}% 修改：删除这一行，因为不需要在这里设置字号
	\justifying\zihao{-4}\setlength{\baselineskip}{20pt}\selectfont
}{%
	\clearpage
}
%------英文摘要-----------

%%%%%%%%%%%%%%%%%%%%%%%%%%%%目录%%%%%%%%%%%%%%%%%%%%%%%%%%%
\makeatletter
\def\@bfdottedtocline#1#2#3#4#5{%
\ifnum #1>\c@tocdepth \else
  \vskip \z@ \@plus.2\p@
  {\leftskip #2\relax \rightskip \@tocrmarg \parfillskip -\rightskip
   \parindent #2\relax\@afterindenttrue
   \interlinepenalty\@M
   \leavevmode %\bfseries
   \@tempdima #3\relax
   \advance\leftskip \@tempdima \null\nobreak\hskip -\leftskip
   {#4}\normalfont\nobreak
   \leaders\hbox{$\m@th
      \mkern \@dotsep mu\hbox{.}\mkern \@dotsep
      mu$}\hfill
   \nobreak
   \hb@xt@\@pnumwidth{\hfil\normalfont \normalcolor #5}%
   \par}%
\fi}
\renewcommand*\l@chapter{\@bfdottedtocline{0}{0em}{1.5em}}
\makeatother
%--------目录-------------

%%%%%%%%%%%%%%%%%%%%%%English Contents%%%%%%%%%%%%%%%%%%%%%%
\makeatletter
\newcommand\engcontentsname{Contents}
\newcommand\tableofengcontents{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\engcontentsname
        \@mkboth{%
           \MakeUppercase\engcontentsname}{\MakeUppercase\engcontentsname}}%
    \@starttoc{toe}% !!!!Define a new contents!!!!
    \if@restonecol\twocolumn\fi
    }
%\newcommand\addengcontents[2]{%
%    \addcontentsline{toe}{#1}{\protect\numberline { \csname the#1\endcsname}#2}}
\newcommand\echapter[1]{\addcontentsline{toe}{chapter}{\protect\numberline{Chapter \thechapter}#1}}
\newcommand\esection[1]{\addcontentsline{toe}{section}{\protect\numberline{\thesection}#1}}
\newcommand\esubsection[1]{\addcontentsline{toe}{subsection}{\protect\numberline{\thesubsection}#1}}
\newcommand\esubsubsection[1]{\addcontentsline{toe}{subsubsection}{\protect\numberline{\thesubsubsection}#1}}
\makeatother
%—————————English Contents—————————————

%%%%%%%%%%%%%%%%%%%%%%%%%符号说明%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand\symboldescriptionname{符号对照表}
\newenvironment{symboldescription}{%
	\newpage
	\phantomsection
	\vspace*{24pt}% 新增：设置标题段前间距为24pt
	\centerline{\zihao{-3}\bfseries\symboldescriptionname}\vspace{18pt}% 修改：设置段后间距为18pt
}{%
	\clearpage
}
%----------------------符号说明-------------------------------
%
%\makeatletter
%\ifSDU@opt@chsstyle
%%%%%%%%%%%%%%%%%%%标题与日期%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\CTEXoptions[figurename={图},tablename={表},bibname={参考文献},contentsname={目\quad{}{}录}]
\CTEXoptions[today=small]
%----标题与日期----
%%%%%%%%%%%%%%%%%%%%%%章节样式%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%--chapter
\CTEXsetup[name={,}]{chapter}
%\CTEXsetup[number={\chinese{chapter}}]{chapter}
\CTEXsetup[format={\centering}]{chapter}
\CTEXsetup[nameformat={\bfseries\heiti\zihao{-3}}]{chapter}
\CTEXsetup[titleformat={\bfseries\heiti\zihao{-3}}]{chapter}
\CTEXsetup[aftername={\quad{}}]{chapter}
\CTEXsetup[beforeskip={24pt}]{chapter}%不知道是不是管章节
\CTEXsetup[afterskip={18pt}]{chapter}
%\CTEXsetup[beforeskip={10pt}]{chapter}%不知道是不是管章节
%\CTEXsetup[afterskip={10pt}]{chapter}
%--section
% \CTEXsetup[name={$\S$\,,}]{section} % 去掉章节前的双S花符号
\CTEXsetup[format={\bfseries\heiti\flushleft\zihao{4}}]{section}
\CTEXsetup[beforeskip={24pt}]{section}
\CTEXsetup[afterskip={6pt}]{section}
%--subsection
\CTEXsetup[format={\bfseries\heiti\flushleft\zihao{-4}}]{subsection}
\CTEXsetup[beforeskip={12pt}]{subsection}
\CTEXsetup[afterskip={6pt}]{subsection}
%--subsubsection
\CTEXsetup[format={\flushleft\heiti\zihao{-4}}]{subsubsection}
\CTEXsetup[beforeskip={12pt}]{subsubsection}
\CTEXsetup[afterskip={6pt}]{subsubsection}
%--appendix
\CTEXsetup[name={附录~}]{appendix}
\CTEXsetup[number={\Alph{chapter}}]{appendix}
%
%%%%%%%%%%%%%%%%%%%致谢%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\acknowledgment}
{
	\clearpage  %加这个命令后，目录中的页码才显示正确
	\phantomsection %加这个命令后，目录中的超链接才指向正确的页码	
	\chapter*{致\hspace{4ex}谢} %开始一段不带编号的章
	\addcontentsline{toc}{chapter}{致\quad{}谢} %使目录中以章级别显示“致谢”
	\addcontentsline{toe}{chapter}{Acknowledgement}
}
%----------致谢---------------------

%%%%%%%%%%%%%%%%%%%%参考文献%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\upcite}[1]{\textsuperscript{\cite{#1}}}
%------参考文献------
\RequirePackage[numbers]{gbt7714}
\renewcommand{\bibfont}{\justifying\zihao{-4}}
\setlength{\bibsep}{0pt plus 0.5ex}
%\else\relax\fi
%\setlength\baselineskip{20pt}\selectfont
\newcommand\ereferences[1]{% Optional argument for the title if it's different from "References"
	\addcontentsline{toe}{chapter}{%
		\if\relax\detokenize{#1}\relax % If no optional argument is provided, use "References"
		References%
		\else
		#1%
		\fi
	}%
}
%----参考文献---------------
%----首行缩进----
\RequirePackage{indentfirst}
%----首行缩进----
%\else\relax\fi
\setlength{\parindent}{2em}
%\makeatletter

%\linespread{1.3}
%\addtolength{\parskip}{.3ex}

%\setlength{\parskip}{0pt}% 设置段前段后间距为0pt
%\setlength{\baselineskip}{20pt}
\raggedbottom% 两端对齐（避免因段落间距不均导致的底部对齐不齐）
%------中文风格------

%%%%%%%%%%%%%%%%%%%封面%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\input{sduthesis-front-cover.def}
%------封面------

%%%%%%%%%%%%%%%%%%%声明%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\input{sduthesis-statement.def}
%------声明------
\makeatletter
%------Make------
\newcommand{\maketitlepagestatement}{%
  \maketitlepage
%  \thispagestyle{empty}
%%  ~
%%  \vfill\eject
%  \thispagestyle{empty}
  \makestatement
%  \vfill\eject
%  \thispagestyle{empty}
%  ~
%  \vfill\eject
  \setcounter{page}{1}
}
\newcommand{\maketableofcontents}{%
    \pagenumbering{Roman}
    \tableofcontents
    \ifSDU@opt@double
        \cleardoublepage
    \else
        \clearpage
    \fi
 %   \pagenumbering{arabic}\setcounter{page}{1}
}
%------Make------
\endinput

%------载入宏包------
%--中文支持
ctex
%--页面设置
geometry
%--页眉页脚
fancyhdr
%--数学支持
amsmath
amsfonts
amsthm
amssymb
amsbsy
bm
mathrsfs
%--图表
graphicx
booktabs
amsmath
%------载入宏包------
