$('document').ready(function() {
	 $('#nodeList').on('click','a', function(e) {
					var str1= "#";
					var str2= $(this).attr("dataidname");
					var dig = str1.concat(str2);
					$( dig ).dialog({
						width: 'auto'
						});
					
				});
});

$('document').ready(function() {
	 $('#policyList').on('click','a', function(e) {
					var str1= "#";
					var str2= $(this).attr("dataidname");
					var dig = str1.concat(str2);
					$( dig ).dialog({
						width: 'auto'
						});
					
				});
});

$('document').ready(function() {
	 $('#imageList').on('click','a', function(e) {
					var str1= "#";
					var str2= $(this).attr("dataidname");
					var dig = str1.concat(str2);
					$( dig ).dialog({
						width: 'auto'
						});
					
				});
});