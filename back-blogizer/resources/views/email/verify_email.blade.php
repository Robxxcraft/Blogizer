<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Verify Email</title>
</head>
<body>
    <div style="background-color: #f1f5f9; border-radius: 2px; padding-left: 2em; padding-right: 2em;">
        <h4 style="margin-bottom: 2rem; color: #10b981; font-size: 1.6em; padding-top: 8px; width: auto;"><svg style="margin-top: 0.8em;" version="1.0" xmlns="http://www.w3.org/2000/svg" width="28px" height="28px" viewBox="0 0 655.000000 748.000000" preserveAspectRatio="xMidYMid meet"><g transform="translate(0.000000,748.000000) scale(0.100000,-0.100000)" fill="currentColor" stroke="none"> <path d="M5361 6758 c-253 -381 -671 -1012 -930 -1403 -258 -390 -894 -1351 -1413 -2134 -519 -783 -946 -1429 -950 -1436 -5 -9 90 -77 310 -223 175 -116 323 -212 330 -214 6 -2 176 245 376 547 200 303 466 703 589 890 124 187 413 624 643 970 229 347 481 727 559 845 78 118 261 395 407 615 896 1353 1188 1796 1187 1803 0 5 -399 272 -620 415 l-29 19 -459 -694z"/><path d="M4057 6772 c-8 -9 -48 -69 -89 -132 -41 -63 -362 -547 -713 -1075 -351 -528 -693 -1043 -760 -1145 -67 -102 -395 -597 -730 -1100 -334 -503 -609 -920 -612 -926 -4 -11 793 -547 807 -542 7 3 181 263 1078 1616 704 1061 1070 1611 1449 2182 210 316 384 582 387 590 4 10 -19 32 -77 69 -756 500-725 480 -740 463z"/><path d="M1317 4360 c-532 -798 -967 -1452 -967 -1455 0 -3 155 -108 345 -235 l345 -230 961 1442 c529 793 964 1449 966 1458 2 10 -95 80 -313 225 -174 116 -329 218 -343 227 l-28 18 -966 -1450z"/><path d="M206 2688 c-7 -37 -99 -2659 -93 -2665 6 -5 119 43 1502 641 528 228 961 419 962 423 1 4 -51 44 -115 87 -64 44 -592 404 -1172 801 -580 396 -1060 724 -1067 728 -8 5 -14 0 -17 -15z"/></g></svg>
            <span style="position: absolute; top: 36px; margin-left: 6px;">Blogizer</span></h4>
        <div style=" margin-bottom: 0.75rem; color: #374151; font-size: 1.2em;">Hello, <span style="font-weight: bold;">{{$user->username}}</span></div>
        <div style=" margin-bottom: 2rem; color: #9ca3af;">Click button below to verificate your account.</div>
        <div style="text-align: center; margin-top: 5em; margin-bottom: 4em;">
            <a type="button" href="{{$url}}" style="padding: 9px; text-transform: uppercase; letter-spacing: -0.05px; margin-bottom: 18px; border: 2px solid; border-radius: 4px; text-decoration: none; color: #f5f5f5; background-color: #10b981;">Verify</a>
        </div>
        <div style="text-align: center; margin-top: 36px; color: #10b981; font-size: 1.2em; font-weight: bold; padding-bottom: 8px;">
            &copy;<span style="margin-left: 2px;">2022</span><span style="padding-left: 24px;">Robxxcraft</span>
        </div>
    </div>
</body>
</html>