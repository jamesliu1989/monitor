	var userEditValidate = function () {	    
	    return {
	        //main function to initiate the module
	        init: function () {

	        	  $('.user_edit-form1').validate({
	  	            errorElement: 'label', //default input error message container
	  	            errorClass: 'help-inline', // default input error message class
	  	            focusInvalid: false, // do not focus the last invalid input
	  	            ignore: "",
	  	            rules: {
	  	            	'user.name': {
	  	                    required: true
	  	                },
	  	                'user.email': {
	  	                    required: false,
	  	                    email: true
	  	                },
	  	                'user.phone': {
	  	                    required: true
	  	                }
	  	            },

		            messages: {
		                'user.name': {
		                    required: "姓名不能为空！"
		                },
		                'user.name': {
		                    required: "电话不能为空！"
		                },
		                'user.email': {
		                	email: "电子邮件格式不合法！"
		                }
		            },
		            
	  	            invalidHandler: function (event, validator) { //display error alert on form submit   

	  	            },

	  	            highlight: function (element) { // hightlight error inputs
	  	                $(element).closest('.control-group').addClass('error'); // set error class to the control group
	  	            },

	  	            success: function (label) {
	  	                label.closest('.control-group').removeClass('error');
	  	                label.remove();
	  	            },

	  	            errorPlacement: function (error, element) {
	  	               error.addClass('help-small no-left-padding').insertAfter(element.closest('.input-icon'));
	  	            },
	  	            
	  	            submitHandler: function (form) {
	  	            	var name = $("input[name='user.name']").val();
	  	            	var phone = $("input[name='user.phone']").val();
	  	            	var email = $("input[name='user.email']").val();
	  	                $.post('userAction_userSelfEdit',{'user.name':name,'user.phone':phone,'user.email':email},
	  	                	  function(data){
	  	                	if(data == 0){
	  	                		alert("修改失败，请重试！");
	  	                	}else{
	  	                		alert("修改成功！");
	  	                	}
	  	                });
	  	            }
	  	            
	  	        });
	        	  
	        	  $('.user_edit-form2').validate({
		  	            errorElement: 'label', //default input error message container
		  	            errorClass: 'help-inline', // default input error message class
		  	            focusInvalid: false, // do not focus the last invalid input
		  	            ignore: "",
		  	            rules: {
		  	            	'user.passWord': {
		  	                    required: true
		  	                },
		  	                rpassword: {
		  	                    equalTo: "#re_password"
		  	                }
		  	            },

			            messages: {
			                'user.passWord': {
			                    required: "密码不能为空！"
			                },
			                rpassword: {
			                	equalTo: "两次输入不一致！"
			                }
			            },
			            
		  	            invalidHandler: function (event, validator) { //display error alert on form submit   

		  	            },

		  	            highlight: function (element) { // hightlight error inputs
		  	                $(element).closest('.control-group').addClass('error'); // set error class to the control group
		  	            },

		  	            success: function (label) {
		  	                label.closest('.control-group').removeClass('error');
		  	                label.remove();
		  	            },

		  	            errorPlacement: function (error, element) {
		  	               error.addClass('help-small no-left-padding').insertAfter(element.closest('.input-icon'));
		  	            },
		  	            
		  	            submitHandler: function (form) {
		  	            	var curpwd = $("input[name='curpwd']").val();
		  	            	var newpwd = $("input[name='newpwd']").val();
		  	                $.post('userAction_changePwd',{curpwd:curpwd,newpwd:newpwd},
		  	                	  function(data){
		  	          		           if(data==0){   //0：系统错误，1：成功 ,2：当前密码错误
		  	          		              alert("密码修改失败，请重试！");
		  	      		               }else if(data==1){
		  	      		                  alert("密码修改成功！");
		  	      		                  window.location.href = "login.jsp";
		  	      		               }else{
		  	      		                  alert("当前密码不正确，请重新输入！");
		  	      		               }
		  	                });
		  	            }
		  	            
		  	        });
	          }
	    
	      };
	      
	  }(); 