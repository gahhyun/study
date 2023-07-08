function goProfile(user_no, user_nicknm) {
	let form = document.createElement('form');				
	
	let data = {
			user_no : user_no,
			toURL : path
    };
	
	for (let key in data) {
        if (data.hasOwnProperty(key)) {
            let obj = document.createElement('input');
            obj.setAttribute('type', 'hidden');
            obj.setAttribute('name', key);
            obj.setAttribute('value', data[key]);
            form.appendChild(obj);
        }
    }
	
	form.setAttribute('method','post');
	form.setAttribute('action','/ottt/profile?user=' +user_nicknm);
					
	document.body.appendChild(form);
	form.submit();				
}