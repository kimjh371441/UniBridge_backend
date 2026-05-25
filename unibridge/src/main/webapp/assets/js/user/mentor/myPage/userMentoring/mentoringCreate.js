/**
 * 멘토링 등록 파일 업로드 핸들링
 */

// 이미지 실시간 미리보기 (JSP의 인라인 onchange에서도 호출 가능하도록 전역 함수로 선언)
function previewImage(input) {
    if (input.files && input.files) {
        var reader = new FileReader();

        reader.onload = function(e) {
            document.getElementById('profilePreview').src = e.target.result;
        };

        reader.readAsDataURL(input.files);
    }
}

document.addEventListener('DOMContentLoaded', () => {
    const fileInput = document.querySelector('#curriculumFile');
    const form = document.querySelector('form');

	// 1. 파일 선택 시 이미지 확장자 검증
    if (fileInput) {
        fileInput.addEventListener('change', function() {
            const file = this.files[0];
            if (file) {
                const allowedExtensions = ['jpg', 'jpeg', 'png', 'gif'];
                const fileName = file.name;
                const fileExtension = fileName.substring(fileName.lastIndexOf('.') + 1).toLowerCase();

                if (!allowedExtensions.includes(fileExtension)) {
                    alert('프로필 사진은 이미지 파일(jpg, jpeg, png, gif)만 업로드 가능합니다.');
                    this.value = '';
                    return;
                }

                previewImage(this);
            }
        });
    }

    // 2. 폼 제출 전 유효성 검사
    if (form) {
        form.addEventListener('submit', (e) => {
            const subject = document.querySelector('#mentoringSubject').value;
            const title = document.querySelector('#mentoringTitle').value.trim();

            if (subject === 'none') {
                alert('학습 과목을 선택해주세요.');
                e.preventDefault();
                return;
            }

            if (!title) {
                alert('멘토링 주제를 입력해주세요.');
                e.preventDefault();
                return;
            }
        });
    }
});