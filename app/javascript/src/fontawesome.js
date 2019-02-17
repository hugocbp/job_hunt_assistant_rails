import { library, dom } from "@fortawesome/fontawesome-svg-core";

import { faHeart } from "@fortawesome/free-regular-svg-icons/faHeart";
import { faPlusSquare } from "@fortawesome/free-regular-svg-icons/faPlusSquare";
import { faTasks } from "@fortawesome/free-solid-svg-icons/faTasks";

library.add(faHeart);
library.add(faPlusSquare);
library.add(faTasks);

dom.watch();
