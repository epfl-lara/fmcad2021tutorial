\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{fmcad}[FMCAD class]

% Author: Georg Weissenbacher
% Copyright FMCAD Association (CC BY-SA)
% ORCID Logo: ORCID (2017) https://doi.org/10.23640/07243.5008697.v2
% CC-BY Logo from https://creativecommons.org/about/downloads/
% doi logo from commons.wikimedia.org

% This package is to be used in combination with
% IEEEtran.cls (c) by Michael Shell a under LaTeX Project Public License 
\LoadClass[conference]{IEEEtran}

% The options of the following packages might clash with
% packages loaded later, e.g., \usepackage[table]{xcolor}
% will lead to a clash. This can be avoided by adding
% \PassOptionsToPackage{table}{xcolor} _before_
% \documentclass{fmcad}

%%
%% We declare the options doi, startpage, and pdfa
%% 
\RequirePackage{ifthen}
\RequirePackage{kvoptions}
\SetupKeyvalOptions{
  family=fmcad,
  prefix=fmcad@
}
\DeclareStringOption[]{doi}
\DeclareStringOption[]{startpage}
\DeclareStringOption[21]{year}

\newboolean{fmcad@mkpdfa}
\setboolean{fmcad@mkpdfa}{false}
\DeclareVoidOption{pdfa}{\setboolean{fmcad@mkpdfa}{true}}

\ProcessKeyvalOptions*\relax

\PassOptionsToPackage{hyperref}{hidelinks}

% check whether user wants to generate PDF/A
\iffmcad@mkpdfa
\RequirePackage[a-1b]{pdfx}
\fi

\RequirePackage{hyperref}
\hypersetup{hidelinks}

\RequirePackage{tikz}
\usetikzlibrary{svg.path}



%%
%% Define colors
%%
\definecolor{fmcadblue}{HTML}{2C3E6B}
\definecolor{orcidgreen}{HTML}{A6CE39}
\definecolor{ccbygray}{HTML}{AAB2AB}
\definecolor{doiorange}{HTML}{FCB425}

%%
%% Define new heades and footers
%%

\pagestyle{headings}

% if startpage is defined then show page numbers, else don't
\ifthenelse{\equal{\fmcad@startpage}{}}{}
           {\pagenumbering{arabic}\setcounter{page}{\fmcad@startpage}}
\newcommand{\fmcad@thepage}{
  \ifthenelse{\equal{\fmcad@startpage}{}}{}{\thepage}}

% Link to ORCID
\newcommand\orcid[1]{\href{https://orcid.org/#1}{\raisebox{-.15em}{\resizebox{1em}{1em}{%
      \begin{pgfpicture}
        \pgfsetcolor{orcidgreen}
        \pgfpathsvg{M106.301,35.435c0,19.572-15.863,35.436-35.436,35.436S35.43,55.007,35.43,35.435S51.293,0,70.865,0
	S106.301,15.863,106.301,35.435z}
        \pgfusepath{fill}
        \pgfsetcolor{white}
        \pgfpathsvg{M59.321,32.39v13.398h-4.264V16.14h4.264V32.39z}
        \pgfpathsvg{M65.578,16.112h11.572c9.772,0,15.724,7.226,15.724,14.839c0,7.004-4.816,14.838-15.779,14.838H65.578 V16.112z M69.841,41.941h6.562c8.305,0,12.098-5.039,12.098-10.99c0-3.654-2.215-10.99-11.877-10.99h-6.782V41.941z}
        \pgfpathsvg{M57.189,54.758c-1.55,0-2.796-1.245-2.796-2.796c0-1.523,1.246-2.797,2.796-2.797s2.796,1.273,2.796,2.797 C59.985,53.485,58.74,54.758,57.189,54.758z}
        \pgfusepath{fill}
      \end{pgfpicture}%
  }}}}

% FMCAD symbol
\newcommand\fmcadsymbol{
  \begin{pgfpicture}
    \pgfsetcolor{fmcadblue}
    \pgfpathsvg{M23.801,12.698c0.282,0,0.537,0.115,0.723,0.3c0.186,0.186,0.301,0.44,0.302,0.721h-0.002 c0,0.283-0.115,0.537-0.3,0.723c-0.187,0.186-0.442,0.303-0.723,0.303V14.74c-0.282,0-0.536-0.113-0.722-0.299 c-0.185-0.186-0.3-0.439-0.3-0.721h-0.002c0.001-0.282,0.116-0.537,0.302-0.723S23.52,12.698,23.801,12.698L23.801,12.698z M20.898,22.705c0.278,0,0.533,0.115,0.72,0.301s0.301,0.441,0.301,0.722h-0.002c0,0.282-0.113,0.537-0.299,0.722 c-0.186,0.186-0.441,0.299-0.722,0.299h-0.001v0.002c-0.28,0-0.536-0.115-0.722-0.301c-0.185-0.185-0.299-0.439-0.299-0.721v-0.001 h-0.002c0.001-0.28,0.114-0.536,0.301-0.722s0.442-0.301,0.722-0.301l0.001,0.002l0,0L20.898,22.705z M7.234,18.349 c0.281,0,0.536,0.115,0.721,0.3c0.186,0.185,0.301,0.44,0.301,0.722H8.254c0,0.281-0.114,0.536-0.299,0.721 c-0.185,0.186-0.439,0.3-0.72,0.302H7.231c-0.28-0.002-0.534-0.116-0.719-0.302c-0.186-0.185-0.3-0.439-0.3-0.721v-0.002 l-0.002,0.002c0-0.281,0.115-0.537,0.302-0.722C6.696,18.464,6.951,18.349,7.234,18.349L7.234,18.349 M18.896,32.585L32.32,19.16 v-5.599L18.76,0h-5.386l-1.767,1.767l1.996,1.996l-0.425,0.426l2.294,2.293l2.062,0.024c0.123-0.431,0.351-0.813,0.658-1.118 c0.469-0.47,1.117-0.759,1.834-0.759l0.002-0.004c0.718,0,1.367,0.291,1.837,0.762c0.469,0.468,0.759,1.117,0.759,1.835 l0.003,0.001v0.001l-0.003,0.002c0,0.717-0.29,1.366-0.759,1.834c-0.47,0.471-1.119,0.761-1.837,0.761l-0.002-0.002 c-0.718,0-1.365-0.29-1.835-0.759c-0.272-0.272-0.485-0.606-0.615-0.979L15.129,8.05c-0.214-0.002-0.405-0.09-0.546-0.229 l-0.001,0.001l-2.519-2.518l-0.4,0.4L9.666,3.708L8.893,4.481l1.996,1.996l-0.396,0.396l6.311,6.312 c0.045-0.009,0.09-0.013,0.137-0.013l4.317,0.018c0.104-0.505,0.355-0.956,0.706-1.307c0.47-0.471,1.119-0.76,1.836-0.76h0.001 c0.717,0,1.366,0.289,1.837,0.76c0.468,0.469,0.758,1.117,0.758,1.834l0.002,0.002c0,0.718-0.29,1.367-0.76,1.837 c-0.47,0.469-1.118,0.759-1.835,0.759l-0.003,0.003c-0.717,0-1.366-0.291-1.837-0.761c-0.228-0.227-0.412-0.496-0.542-0.793 l-3.051-0.014l3.456,3.457l-0.002,0.002c0.142,0.143,0.23,0.34,0.23,0.558l-0.011,2.616v0.017c0.255,0.126,0.488,0.293,0.687,0.491 c0.469,0.469,0.759,1.117,0.759,1.835l0.004,0.002c0,0.717-0.291,1.366-0.762,1.837c-0.47,0.471-1.12,0.76-1.836,0.76h-0.001 l-0.002-0.002c-0.719,0-1.365-0.289-1.834-0.758c-0.471-0.471-0.762-1.119-0.762-1.836v-0.001l0.002-0.002 c0-0.718,0.291-1.366,0.76-1.835c0.375-0.376,0.865-0.637,1.416-0.725l0.007-2.074L9.379,7.987L8.948,8.419L6.952,6.423 L6.178,7.195l1.996,1.998L7.76,9.606l6.979,6.979l-0.002,0.002c0.145,0.145,0.234,0.346,0.229,0.567l-0.042,3.159 c0.093,0.06,0.18,0.129,0.261,0.21c0.613,0.615,0.613,1.613,0,2.227c-0.615,0.616-1.613,0.616-2.229,0 c-0.616-0.613-0.616-1.611,0-2.227c0.119-0.12,0.253-0.216,0.396-0.289l0.038-2.766l-6.746-6.746l-0.412,0.412L4.237,9.137 L3.464,9.912l1.996,1.994L5.006,12.36l3.062,3.062l-0.001,0.002c0.137,0.138,0.225,0.326,0.229,0.537l0.025,1.051 c0.28,0.129,0.533,0.307,0.749,0.523c0.468,0.467,0.758,1.116,0.758,1.834l0.003,0.002c0,0.717-0.291,1.366-0.761,1.836 c-0.469,0.469-1.118,0.758-1.835,0.758H7.231c-0.717,0-1.366-0.289-1.834-0.758c-0.472-0.47-0.762-1.119-0.762-1.836v-0.002h0.003 c0-0.718,0.29-1.367,0.759-1.834c0.359-0.361,0.825-0.615,1.346-0.716l-0.012-0.503l-2.84-2.84l-0.372,0.371l-1.996-1.996L0,13.375 v5.662l13.548,13.549H18.896z M20.028,6.203c0.283,0,0.537,0.113,0.723,0.299s0.299,0.44,0.301,0.721v0.001H21.05v0.001h0.002 v0.002c-0.002,0.281-0.115,0.533-0.301,0.72c-0.186,0.185-0.44,0.3-0.723,0.3v0.002c-0.281,0-0.535-0.115-0.722-0.302 c-0.185-0.185-0.3-0.44-0.3-0.722l-0.002-0.002c0-0.28,0.115-0.534,0.302-0.721c0.187-0.186,0.442-0.301,0.722-0.301V6.203z}
    \pgfusepath{fill}
  \end{pgfpicture}
}

% CC BY logo
\newcommand\ccbylogo{
  \begin{pgfpicture}
    \pgfsetcolor{ccbygray}
    \pgfpathsvg{M179.087,38.513V0.807h119.82l0.14,37.567c0,3.416-1.423,3.18-3.017,3.18l-114.064,0.202 C179.25,41.757,179.087,40.198,179.087,38.513z}
    \pgfusepath{fill}
    \pgfsetcolor{black}
    \pgfpathsvg{M299.558,40.007V0.51c0-0.282-0.229-0.51-0.511-0.51h-119.73c-0.282,0-0.51,0.228-0.51,0.51v39.497 c0,1.246,1.015,2.26,2.261,2.26h116.229C298.544,42.268,299.558,41.253,299.558,40.007z M179.828,40.007c0,0,0-15.949,0-27.45 h4.078c3.043-5.509,8.908-9.244,15.643-9.244c6.732,0,12.599,3.739,15.644,9.244h83.344c0,11.502,0,27.45,0,27.45 c0,0.683-0.556,1.238-1.24,1.238H181.067C180.384,41.245,179.828,40.69,179.828,40.007z}
    \pgfusepath{fill}
    \pgfsetcolor{white}
    \pgfpathsvg{M253.077,9.311h-3.141V2.648h3.236c0.3,0,0.591,0.037,0.875,0.112s0.537,0.19,0.758,0.346 c0.221,0.155,0.398,0.356,0.529,0.601s0.197,0.537,0.197,0.873c0,0.417-0.102,0.774-0.305,1.069 c-0.203,0.297-0.511,0.503-0.924,0.621c0.299,0.143,0.526,0.326,0.678,0.551c0.153,0.223,0.23,0.502,0.23,0.838 c0,0.313-0.052,0.572-0.154,0.784c-0.103,0.211-0.249,0.381-0.435,0.508c-0.187,0.128-0.411,0.219-0.672,0.275 C253.684,9.283,253.396,9.311,253.077,9.311L253.077,9.311z M251.405,6.616v1.555h1.374c0.13,0,0.257-0.011,0.378-0.032 c0.121-0.021,0.229-0.06,0.322-0.116c0.093-0.056,0.168-0.134,0.225-0.233c0.055-0.099,0.084-0.227,0.084-0.382 c0-0.279-0.084-0.481-0.253-0.604c-0.169-0.124-0.383-0.187-0.645-0.187H251.405z M251.405,3.788v1.828h1.6 c0.317,0,0.573-0.073,0.766-0.218c0.193-0.146,0.29-0.391,0.29-0.733c0-0.173-0.029-0.316-0.089-0.428 c-0.059-0.112-0.138-0.2-0.238-0.265c-0.1-0.065-0.216-0.112-0.346-0.141c-0.132-0.028-0.268-0.042-0.412-0.042H251.405z}
    \pgfpathsvg{M258.234,5.242V2.648h1.469v2.557l2.473,4.106h-1.633l-1.551-2.632l-1.561,2.632h-1.644 L258.234,5.242z}
    \pgfusepath{fill}
    \pgfsetcolor{white}
    \pgfpathsvg{M213.774,23.091c-0.006,7.972-6.469,14.428-14.44,14.424 c-7.971-0.007-14.429-6.472-14.424-14.44c0-0.006,0-0.013,0-0.018c0.004-7.969,6.471-14.426,14.44-14.422 c7.971,0.006,14.427,6.47,14.422,14.44C213.774,23.079,213.774,23.085,213.774,23.091z}
    \pgfusepath{fill};
    \pgfsetcolor{black}
    \pgfpathsvg{M199.322,39.629c-4.58,0-8.455-1.6-11.627-4.801c-3.257-3.311-4.885-7.229-4.885-11.754 c0-4.528,1.628-8.417,4.885-11.673c3.254-3.255,7.132-4.884,11.627-4.884c4.552,0,8.497,1.642,11.835,4.925 c3.146,3.118,4.717,6.995,4.717,11.632c0,4.634-1.6,8.553-4.8,11.754S203.957,39.629,199.322,39.629z M199.372,36.649 c3.752,0,6.949-1.317,9.584-3.954c2.636-2.636,3.955-5.846,3.955-9.627c0-3.808-1.298-6.967-3.893-9.479 c-2.732-2.705-5.949-4.058-9.647-4.058c-3.7,0-6.887,1.339-9.564,4.017c-2.678,2.676-4.017,5.851-4.017,9.52 c0,3.672,1.353,6.875,4.057,9.607C192.442,35.325,195.618,36.649,199.372,36.649z M199.157,25.806 c-0.882,1.603-2.343,2.408-4.38,2.408c-1.378,0-2.527-0.462-3.45-1.39c-0.923-0.924-1.386-2.177-1.386-3.75 c0-1.604,0.448-2.86,1.344-3.773c0.895-0.912,2.087-1.366,3.573-1.366c1.928,0,3.375,0.855,4.338,2.569l-2.021,1.077 c-0.414-0.958-1.102-1.437-2.065-1.437c-1.46,0-2.188,0.981-2.188,2.946c0,1.964,0.729,2.947,2.188,2.947 c0.826,0,1.445-0.451,1.857-1.354L199.157,25.806z M208.715,25.806c-0.878,1.603-2.336,2.408-4.371,2.408 c-1.403,0-2.559-0.462-3.464-1.39c-0.907-0.924-1.361-2.177-1.361-3.75c0-1.604,0.447-2.86,1.341-3.773 c0.895-0.912,2.083-1.366,3.567-1.366c1.925,0,3.371,0.855,4.332,2.569l-2.068,1.077c-0.385-0.958-1.062-1.437-2.025-1.437 c-1.489,0-2.233,0.981-2.233,2.946c0,1.964,0.744,2.947,2.233,2.947c0.799,0,1.407-0.451,1.819-1.354L208.715,25.806z}
    \pgfusepath{fill}
    \pgfsetcolor{white}
    \pgfpathsvg{M265.092,27.184c-0.004,5.261-4.27,9.522-9.53,9.52c-5.26-0.006-9.522-4.271-9.52-9.531 c0-0.004,0-0.008,0-0.011c0.003-5.26,4.27-9.521,9.53-9.519c5.26,0.005,9.521,4.271,9.519,9.53 C265.092,27.175,265.092,27.18,265.092,27.184z}
    \pgfusepath{fill}
    \pgfsetcolor{black}
    \pgfpathsvg{M258.678,30.081v-4.772h-1.332v-5.653h-3.617v5.653h-1.33v4.772c0,0.417,0.338,0.753,0.752,0.753h4.774 C258.34,30.834,258.678,30.498,258.678,30.081L258.678,30.081z}
    \pgfusepath{fill}
    \pgfsetcolor{black}
    \pgfpathsvg{M263.82,35.477c2.258-2.256,3.388-5.017,3.388-8.285c0-3.267-1.11-6-3.331-8.195 c-2.354-2.315-5.139-3.471-8.354-3.471c-3.174,0-5.909,1.147-8.207,3.442c-2.299,2.294-3.446,5.038-3.446,8.227 s1.149,5.951,3.446,8.285c2.24,2.256,4.975,3.383,8.207,3.383C258.795,38.859,261.561,37.732,263.82,35.477z M248.836,33.959 c-1.908-1.924-2.863-4.182-2.863-6.768s0.942-4.822,2.834-6.708c1.887-1.886,4.135-2.829,6.746-2.829 c2.609,0,4.877,0.953,6.805,2.859c1.832,1.77,2.746,3.997,2.746,6.68c0,2.664-0.935,4.92-2.804,6.767 c-1.849,1.867-4.1,2.802-6.747,2.802C252.904,36.76,250.666,35.826,248.836,33.959z}
    \pgfusepath{fill}
    \pgfsetcolor{black}
    \pgfpathsvg{M257.212,33.035c0,0.922-0.748,1.669-1.67,1.669c-0.921-0.002-1.668-0.75-1.668-1.671 c0,0,0-0.001,0-0.002c0-0.921,0.748-1.668,1.67-1.668c0.921,0,1.668,0.748,1.668,1.67C257.212,33.033,257.212,33.033,257.212,33.035 z}
    \pgfusepath{fill}
  \end{pgfpicture}
}

% DOI logo
\newcommand\doilogo{
  \begin{pgfpicture}
    \pgfsetcolor{doiorange}
    \pgfpathsvg{M128.993,65.002c0.021,35.325-28.609,63.971-63.955,64C29.695,129.02,1.018,100.4,1,65.08 c0-0.021,0-0.051,0-0.077C0.979,29.685,29.618,1.031,64.964,1.001c35.352-0.018,64.012,28.597,64.038,63.928 C129.002,64.955,129.002,64.98,128.993,65.002z}
    \pgfusepath{fill}
    \pgfsetcolor{black}
    \pgfpathsvg{M49.819,104.629H37.965v-25.42c-1.357,1.408-3.649,2.855-4.93,3.469c-2.228,1.076-5.354,1.304-7.89,1.304 c-4.353,0-8.456-2.315-11.81-5.21c-4.226-3.637-6.338-8.502-6.338-14.597c0-5.992,1.937-11.552,6.06-15.188 c3.458-3.048,7.401-4.447,11.831-4.447c2.74,0,5.661,0.783,7.812,1.986c1.229,0.691,4.061,2.232,5.265,3.743v-4.825h11.854V104.629z M34.791,57.672c-1.562-1.562-4.273-2.519-6.552-2.519c-2.535,0-4.246,1.299-5.833,3.193c-1.306,1.537-2.047,3.73-2.047,5.701 c0,1.973,0.653,4.341,1.959,5.878c1.613,1.895,3.938,3.721,6.448,3.721c2.253,0,5.14-1.408,6.728-2.996 c1.588-1.562,2.206-4.26,2.206-6.515C37.699,61.857,36.378,59.234,34.791,57.672z}
    \pgfusepath{fill}
    \pgfsetcolor{white}
    \pgfpathsvg{M110.459,102.311c1.384-1.357,2.075-3.021,2.075-4.994c0-1.996-0.691-3.688-2.075-5.07 c-1.356-1.357-3.033-2.035-5.031-2.035c-1.972,0-3.649,0.691-5.032,2.074c-1.356,1.383-2.036,3.061-2.036,5.031 c0,1.973,0.68,3.637,2.036,4.994c1.383,1.383,3.061,2.074,5.032,2.074S109.076,103.693,110.459,102.311z M74.219,84.495 c6.736,0,12.113-2.283,16.134-6.849c3.278-3.729,4.917-8.174,4.917-13.333c0-5.215-1.626-9.686-4.879-13.414 c-3.943-4.539-9.462-6.809-16.555-6.809c-7.119,0-12.651,2.27-16.595,6.809c-3.252,3.729-4.878,8.308-4.878,13.738 c0,4.89,1.639,9.226,4.917,13.009C61.249,82.212,66.896,84.495,74.219,84.495L74.219,84.495z M111.728,83.108V45.474h-12.6v37.635 H111.728z M67.459,69.946c-1.332-1.647-1.998-3.526-1.998-5.633c0-2.135,0.666-4.025,1.998-5.674c1.639-2.053,3.764-3.08,6.377-3.08 c2.33,0,4.302,0.838,5.915,2.514c1.613,1.701,2.42,3.781,2.42,6.24c0,2.431-0.819,4.483-2.458,6.159 c-1.613,1.702-3.572,2.555-5.877,2.555C71.223,73.027,69.098,72,67.459,69.946z}
    \pgfusepath{fill}
  \end{pgfpicture}
}

\makeatletter

% Add page numbers to standard page style
\def\@oddfoot{\hbox{}\footnotesize\hfil\fmcad@thepage\hfil}\relax
\def\@evenfoot{\hbox{}\footnotesize\hfil\fmcad@thepage\hfil}\relax

\def\ps@IEEEtitlepagestyle{% Override IEEE titlepage with FMCAD titlepage
  \def\@oddhead{\hbox{}\normalfont\hfil\href{https://fmcad.org/FMCAD\fmcad@year}{\raisebox{-.25em}{\resizebox{1.5em}{!}{\fmcadsymbol}} \color{black}{Formal Methods in Computer-Aided Design 20\fmcad@year}} \hfil}\relax
  \def\@oddfoot{%
    \begin{minipage}[b]{\textwidth}
      \raisebox{\baselineskip}{\rule{.25\textwidth}{.5pt}}\newline
      \href{https://doi.org/\fmcad@doi}{
        {\normalsize\raisebox{-.35em}{\resizebox{1.5em}{!}{\doilogo}}}}
        {\footnotesize \url{https://doi.org/\fmcad@doi}}%
      \hfill
      \href{https://creativecommons.org/licenses/by/4.0/}{
        \footnotesize\raisebox{-.75\baselineskip}{\resizebox{!}{2\baselineskip}{\ccbylogo}}
      \parbox{.3\textwidth}{\footnotesize 
        \color{black}{
          This article is licensed under a Creative
          \hbox{Commons} Attribution 4.0 International License}}}
      \hfill
    \end{minipage}}\relax
  \let\@evenhead\@empty
  \let\@evenfoot\@empty
}

\makeatother

% Print copyright notice to console
\AtEndDocument{
  \typeout{}
  \typeout{FMCAD document class by FMCAD Association (under a CC BY-SA license).}
  \typeout{}
}