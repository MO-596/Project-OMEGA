ini_open("savedata.ini");
best_time = ini_read_real("endless", "best_time", 0);
best_score_endless = ini_read_real("endless", "best_score", 0);
best_score_regular = ini_read_real("regular", "best_score", 0);
ini_close();