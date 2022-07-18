// 랜드마크, 코스 조회 슬라이드
const cLeftBtn = document.getElementById("courseLeft");
const cRrightBtn = document.getElementById("courseRight");
let courseArea = 1;
let pageSize1 = document.getElementsByClassName("course-content");

const lLeftBtn = document.getElementById("landmarkLeft");
const lRrightBtn = document.getElementById("landmarkRight");
let landmarkArea = 1;
let pageSize2 = document.getElementsByClassName("landmark-content");

// 코스
function courseLeftSlide() {
    if (courseArea == 1) {
        document.querySelector(".course-list").style.transform = "translateX(0px)";
        alert("첫 페이지입니다.");
    } else {
        courseArea = courseArea - 1;
        document.querySelector(".course-list").style.transform = "translateX(-" + (courseArea-1)*250 + "px)";
    }
}
function courseRightSlide(){
    if((courseArea+3) == pageSize1.length || pageSize1.length < 5){
        alert("마지막 페이지입니다.");
    } 
    if((courseArea+3) < pageSize1.length){
        document.querySelector(".course-list").style.transform = "translateX(-" + courseArea*250 + "px)";
        courseArea = courseArea + 1;
    }
}

// 랜드마크
function landmarkLeftSlide(){
    if (landmarkArea == 1) {
        document.querySelector(".landmark-list").style.transform = "translateX(0px)";
        alert("첫 페이지입니다.");
    } else {
        landmarkArea = landmarkArea - 1;
        document.querySelector(".landmark-list").style.transform = "translateX(-" + (landmarkArea-1)*250 + "px)";
    }
}
function landmarkRightSlide(){
    if((landmarkArea+3) == pageSize2.length || pageSize2.length < 5){
        alert("마지막 페이지입니다.");
    } 
    if((landmarkArea+3) < pageSize2.length){
        document.querySelector(".landmark-list").style.transform = "translateX(-" + landmarkArea*250 + "px)";
        landmarkArea = landmarkArea + 1;
    }
}



// 즐겨찾기 탭
$(document).ready(function () {
    $(".tab_title li").click(function () {
        var idx = $(this).index();

        $(".tab_title li").removeClass("current-tab");
        $(".tab_title li").eq(idx).addClass("current-tab");

        $(".tab_content > div").hide();

        $.ajax({
            url: "my-favorite",
            type: "GET",
            data: { "indexFlag": idx },
            dataType: "JSON",
            success: function (result) {
                console.log(result);
                const a = $(".landmark-list")
                const b = $(".course-list")
                // 배열의 담긴 게 없을때 
                if (result.length == 0) {
                    if (idx == 0) {
                        a.text("아직 즐겨찾는 랜드마크가 없습니다.\n마음에든 랜드마크를 추가 해주세요.");
                    }
                    if (idx != 0) {
                        b.text("아직 즐겨찾는 코스가 없습니다.\n마음에든 코스를 추가 해주세요.")
                    }
                }

                //배열에 담긴 게 있을때
                if (result.length != 0) {
                    if (idx != 0) {
                        // 슬라이드 담기
                        const courseSlider = document.getElementsByClassName("courseSlider")[0];
                        courseSlider.innerHTML = "";

                        const courseLeft = document.createElement("i");
                        courseLeft.classList.add("fa-solid");
                        courseLeft.classList.add("fa-circle-chevron-left");
                        courseLeft.classList.add("fa-3x");
                        courseLeft.id = "courseLeft";
                        courseLeft.style.color = "#bbd0ff";
                        courseLeft.setAttribute("onclick", "courseLeftSlide()");

                        const courseRight = document.createElement("i");
                        courseRight.classList.add("fa-solid");
                        courseRight.classList.add("fa-circle-chevron-right");
                        courseRight.classList.add("fa-3x");
                        courseRight.id = "courseRight";
                        courseRight.style.color = "#bbd0ff";
                        courseRight.setAttribute("onclick", "courseRightSlide()");

                        courseSlider.append(courseLeft, courseRight);

                        // 코스 내용 담기
                        const courseList = document.getElementById("course-list");
                        courseList.innerHTML = "";

                        for(let course of result){
                            const courseContent = document.createElement("div");
                            courseContent.classList.add("course-content");
                            courseList.append(courseContent);

                            const courseImg = document.createElement("div");
                            courseImg.classList.add("course-img");
                            courseContent.append(courseImg);

                            const courseInfo = document.createElement("a");
                            // 링크 걸기
                            courseInfo.setAttribute("href", "#");

                            const courseTitle = document.createElement("h1");
                            courseTitle.innerText = course.movelineTitle;

                            const courseUl = document.createElement("ul");
                            courseInfo.append(courseTitle, courseUl);

                            const courseLi = document.createElement("li");
                            courseLi.innerText = "지역 : " + course.locationName;
                            courseUl.append(courseLi);

                            const image = document.createElement("img");
                            image.setAttribute("src", contextPath + course.reNameImage);
                            courseImg.append(courseInfo, image);
                        }
                    }
                }
            }
        })
        $(".tab_content > div").eq(idx).show();
        $(".tab_content > div").eq(idx).css("display", "flex");
    })
});



