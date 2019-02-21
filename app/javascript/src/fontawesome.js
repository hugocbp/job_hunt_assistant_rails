import { library, dom } from "@fortawesome/fontawesome-svg-core";

import { faHeart } from "@fortawesome/free-regular-svg-icons/faHeart";
import { faPlusSquare } from "@fortawesome/free-regular-svg-icons/faPlusSquare";
import { faTasks } from "@fortawesome/free-solid-svg-icons/faTasks";
import { faPlusCircle } from "@fortawesome/free-solid-svg-icons/faPlusCircle";
import { faChartLine } from "@fortawesome/free-solid-svg-icons/faChartLine";
import { faArrowRight } from "@fortawesome/free-solid-svg-icons/faArrowRight";
import { faArrowLeft } from "@fortawesome/free-solid-svg-icons/faArrowLeft";

library.add(faHeart);
library.add(faPlusSquare);
library.add(faTasks);
library.add(faPlusCircle);
library.add(faChartLine);
library.add(faArrowLeft);
library.add(faArrowRight);

dom.watch();
