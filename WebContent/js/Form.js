function idCheck() {
		var tempID = document.frm.m_id.value;
		window.open("idDuplicate.jsp?m_id=" + tempID, "idCheck", "width=200, height=200");
		return false;
}

function formChk() {
	if(document.frm.m_id.value=='') {
		alert('아이디는 필수 항목입니다!!');
		document.frm.m_id.focus();
		return;
	}
	if(document.frm.m_pass.value=='') {
		alert('패스워드는 필수 항목입니다!');
		document.frm.m_pass.focus();
		return;
	}
	if(document.frm.m_name.value=='') {
		alert('이름은 필수 항목입니다!');
		document.frm.m_name.focus();
		return;
	}
	if(document.frm.m_pass.value.length<=4 || document.frm.m_pass.value.length>=10) {
		alert('패스워드는 4~10 사이로 입력하세요!');
		return;
	}
	var p = /^([0-9a-zA-Z]+)$/;
	if(!p.test(document.frm.m_pass.value)) {		
		alert("패스워드는 영문자와 숫자만 입력할 수 있습니다.");
		document.frm.m_pass.focus();
		return;
	}
	p = /^([0-9]+)([0-9]+)([0-9]+)$/;
	if(!(p.test(document.frm.m_phone.value))) {
		alert("폰번호입력하셈!");
		document.frm.m_phone.focus();
		return;
	}
	document.frm.submit();
}