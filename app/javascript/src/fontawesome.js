import { library, dom } from "@fortawesome/fontawesome-svg-core";

import { faHeart } from "@fortawesome/free-regular-svg-icons/faHeart";
import { faPlusSquare } from "@fortawesome/free-regular-svg-icons/faPlusSquare";
import { faTasks } from "@fortawesome/free-solid-svg-icons/faTasks";
import { faPlusCircle } from "@fortawesome/free-solid-svg-icons/faPlusCircle";

library.add(faHeart);
library.add(faPlusSquare);
library.add(faTasks);
library.add(faPlusCircle);

dom.watch();
