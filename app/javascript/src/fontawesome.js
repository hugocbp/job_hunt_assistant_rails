import { library, dom } from "@fortawesome/fontawesome-svg-core";

import { faHeart } from "@fortawesome/free-regular-svg-icons/faHeart";
import { faPlusSquare } from "@fortawesome/free-regular-svg-icons/faPlusSquare";
import { faTasks } from "@fortawesome/free-solid-svg-icons/faTasks";
import { faPlusCircle } from "@fortawesome/free-solid-svg-icons/faPlusCircle";
import { faChartLine } from "@fortawesome/free-solid-svg-icons/faChartLine";

library.add(faHeart);
library.add(faPlusSquare);
library.add(faTasks);
library.add(faPlusCircle);
library.add(faChartLine);

dom.watch();
