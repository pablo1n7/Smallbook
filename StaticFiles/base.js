function format(){
    		var b=document.getElementsByTagName("pre");
    		for (i=0;b.length;i++) {
    			hljs.highlightBlock(b[i],false);
    		}
		}