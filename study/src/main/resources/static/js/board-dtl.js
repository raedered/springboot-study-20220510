const boardListTable = document.querySelector(".board-list-table");
const updateBtn = document.querySelector(".update-btn");
const deleteBtn = document.querySelector(".delete-btn");

let path = window.location.pathname;
let boardCode = path.substring(path.lastIndexOf("/")+1);

/*
Promise
*/

/*function test(data) {
	return new Promise((resolve, reject) => {
		if(data > 100){
			resolve(data);			
		}else{
			throw reject(new Error("data가 100보다 작거나 같습니다."));
		}
	})
}

test(500)
.then(testData => testData + 100)
.then(testData2 => alert(testData2))
.catch(error => {console.log(error)});*/

 
/*function submit() {
	$.ajax({
		type: "post",
		url: "/board",
		contentType: "application/json",
		data: JSON.stringify({
			title: inputItems[0].value,
			content: textareaItem.value,
			usercode: inputItems.value
		}),
		dataType: "text",
		success: data => {
			let dataObj = JSON.parse(data);
			alert(dataObj.msg);
			location.href = "/board/dtl/" + dataObj.data;	
		},
		error:() => {
			alert("비동기 처리 오류");
		}
	})
}*/
 load();
 
 function load(){
	$.ajax({
		type: "get",
		url: `/api/board/${boardCode}`,
		data: JSON.stringify(),
		contentType: "application/json",
		dataType: "text",
		success: function(data){
			let boardObj = JSON.parse(data);
			getBoardDtl(boardObj.data);
		},
		error: function(){
			alert("비동기 처리 오류");
		}
	});
}

function getBoardDtl(data) {
	boardListTable.innerHTML = `
		<tr>
			<th>제목</th>
			<td>${data.title}</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${data.username}</td>
		</tr>
		<tr>
			<th>조회수</th>
			<td>${data.boardCount}</td>
		</tr>
		<tr>
			<th>내용</th>
			<td><pre>${data.content}</pre></td>
		</tr>
	`;	
}

updateBtn.onclick = () => {
	location.href = "/board/" + boardCode;
}

deleteBtn.onclick = () => {
	let flag = confirm("정말로 게시글을 삭제 하시겠습니까?");
	if(flag == true){
		let url = "/api/board/" + boardCode;
		let option = {
			method: "DELETE"
		}
		fetch(url, option)
		.then(response => {
			if(response.ok){
				return response.json();
			}else {
				throw new Error("비동기 처리 오류");
			}
		})
		.then(result => {
			console.log(result);
			location.replace("/board/list");
		})
		.catch(error => {
			console.log(error);
		});
	}
}