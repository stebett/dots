

/* appearance */
static const unsigned int borderpx  = 2;        /* border pixel of windows */
static const unsigned int gappx     = 10;       /* gap pixel between windows */
static const unsigned int snap      = 31;       /* snap pixel */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
static const char *fonts[]          = { "Anonymous Pro:pixelsize=22:style:bold" };

static const char dmenufont[]       = "Anonymous Pro:pixelsize=22:style:bold";

static const char col_bg[]          = "#282828";
static const char col_red1[]        = "#cc241d";
static const char col_red2[]        = "#fb4934";
static const char col_green1[]      = "#98971a";
static const char col_green2[]      = "#b8bb36";
static const char col_yellow1[]     = "#d79921";
static const char col_yellow2[]     = "#fabd3f";
static const char col_blue1[]       = "#458588";
static const char col_blue2[]       = "#83a598";
static const char col_purple1[]     = "#b16286";
static const char col_purple2[]     = "#d3869b";
static const char col_gray1[]       = "#928374";
static const char col_gray2[]       = "#a89984";
static const char col_aqua1[]       = "#689d6a";
static const char col_aqua2[]       = "#8ec07c";
static const char col_orange1[]     = "#d65d0e";
static const char col_orange2[]     = "#fe8019";
static const char col_fg[]          = "#ebdbb2";
static const char *colors[][3]      = {
    /*              fg          bg          border */
    [SchemeNorm] = { col_bg,    col_fg,    col_bg},
    [SchemeSel]  = { col_fg,    col_bg,    col_fg},
};
/* static const char normbordercolor[] = "#B8611F"; */

/* tagging */
static const char *tags[] = { "", "", " ", " ", "", "", "", "", ""  };

static const Rule rules[] = {
	/* class      instance    title       tags mask     isfloating   isterminal noswallow monitor */
	{ "Gimp",     NULL,       NULL,       0,            1,           0,         0,        -1 },
	{ "st",       NULL,       NULL,       0,            0,           1,         1,        -1 },
	{ "matplotlib", NULL,       NULL,       0,            1,           1,         1,        -1 },
};

/* layout(s) */
static const float mfact     = 0.50; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 2;    /* number of clients in master area */
static const int resizehints = 1;    /* 1 means respect size hints in tiled resizals */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "",      tile },    /* first entry is default */
	{ "",      NULL },    /* no layout function means floating behavior */
	{ "",      monocle },
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */

static const char *dmenucmd[]     = { "dmenu_run", "-m", dmenumon, "-fn", dmenufont, "-nb", col_bg, "-nf", col_fg, "-sb", col_orange1, "-sf", col_fg, "-i", NULL };
static const char *termcmd[]      = { "st",  NULL };
static const char *browsercmd[]   = { "google-chrome-stable", NULL };
static const char *rangercmd[]    = { "st", "ranger", NULL };
static const char *lightupcmd[]   = { "xbacklight", "-inc", "2.5", NULL};
static const char *lightdowncmd[] = { "xbacklight", "-dec", "2.5", NULL};
static const char *lightmincmd[]  = { "xbacklight", "-set", ".15", NULL};
static const char *soundupcmd[]   = { "amixer", "-c", "0", "set", "Master", "10%+", NULL};
static const char *sounddowncmd[] = { "amixer", "-c", "0", "set", "Master", "10%-", NULL};
static const char *soundmutecmd[] = { "amixer", "-c", "0", "set", "Master", "0%", NULL};
static const char *wifi[]         = { "sudo /home/ginko/Documents/scripts/wifi/./scan.sh", NULL};


static Key keys[] = {
	/* modifier                     key        function        argument */
    
    { MODKEY,                       XK_F1,     spawn,          {.v = soundmutecmd } },
    { MODKEY,                       XK_F2,     spawn,          {.v = sounddowncmd } },
    { MODKEY,                       XK_F3,     spawn,          {.v = soundupcmd } },
    { MODKEY,                       XK_F5,     spawn,          {.v = wifi } },
    { MODKEY,                       XK_F8,     spawn,          {.v = lightmincmd } },
    { MODKEY,                       XK_F9,     spawn,          {.v = lightdowncmd } },
    { MODKEY,                       XK_F10,    spawn,          {.v = lightupcmd } },
	{ MODKEY,                       XK_p,      spawn,          {.v = dmenucmd } },
	{ MODKEY,                       XK_w,      spawn,          {.v = termcmd } },
	{ MODKEY,                       XK_e,      spawn,          {.v = browsercmd } },
	{ MODKEY,                       XK_r,      spawn,          {.v = rangercmd } },
	{ MODKEY,                       XK_b,      togglebar,      {0} },
	{ MODKEY,                       XK_j,      focusstack,     {.i = -1 } },
	{ MODKEY,                       XK_k,      focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_h,      focusstack,     {.i = -1 } },
	{ MODKEY,                       XK_l,      focusstack,     {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_i,      incnmaster,     {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_o,      incnmaster,     {.i = -1 } },
	{ MODKEY,                       XK_i,      setmfact,       {.f = -0.05} },
	{ MODKEY,                       XK_o,      setmfact,       {.f = +0.05} },
	{ MODKEY,                       XK_u,      zoom,           {0} },
	{ MODKEY,                       XK_Tab,    view,           {0} },
	{ MODKEY,                       XK_x,      killclient,     {0} },
	{ MODKEY,                       XK_t,      setlayout,      {.v = &layouts[0]} },
	{ MODKEY,                       XK_f,      setlayout,      {.v = &layouts[1]} },
	{ MODKEY,                       XK_m,      setlayout,      {.v = &layouts[2]} },
	{ MODKEY,                       XK_space,  setlayout,      {0} },
	{ MODKEY|ShiftMask,             XK_space,  togglefloating, {0} },
	{ MODKEY,                       XK_0,      view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_0,      tag,            {.ui = ~0 } },
	{ MODKEY,                       XK_comma,  focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_period, focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_comma,  tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period, tagmon,         {.i = +1 } },

	TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
	TAGKEYS(                        XK_5,                      4)
	TAGKEYS(                        XK_6,                      5)
	TAGKEYS(                        XK_7,                      6)
	TAGKEYS(                        XK_8,                      7)
	TAGKEYS(                        XK_9,                      8)
	{ MODKEY|ShiftMask,             XK_q,      quit,           {0} },
	{ MODKEY|ControlMask|ShiftMask, XK_q,      quit,           {1} }, 
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};

