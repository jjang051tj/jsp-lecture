<%--
  Created by IntelliJ IDEA.
  User: tjoeunis205
  Date: 2024-11-29
  Time: 오후 12:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/header.jsp" %>

<h2 class="my-5">WRITE</h2>
<c:set var="action" value="${replyBoardDto==null ? '../board/write':'../board/reply'}"></c:set>
<form action="${action}" method="post">
    <input type="hidden" name="parentId" value="${param.no}">
    <div class="mb-5">
        <label for="title" class="form-label fw-bold fs-5">TITLE</label>
        <c:choose>
            <c:when test="${replyBoardDto ne null}">
                <input type="text" class="form-control form-control" name="title" id="title" placeholder="제목을 입력하세요."
                       value="[RE] ${replyBoardDto.title}">
            </c:when>
            <c:otherwise>
                <input type="text" class="form-control form-control" name="title" id="title" placeholder="제목을 입력하세요.">
            </c:otherwise>
        </c:choose>
    </div>
    <div class="mb-3">
        <label for="content" class="form-label fw-bold fs-5">CONTENT</label>
        <textarea class="form-control" id="content" name="content" rows="8"></textarea>
    </div>
    <div class="mb-5">
        <label for="password" class="form-label fw-bold fs-5">PASSWORD</label>
        <input type="text" class="form-control form-control" name="password" id="password" placeholder="비밀번호를 입력하세요.">
    </div>
    <input type="hidden" name="userId" value="jjang051">
    <input type="hidden" name="userName" value="장성호">
    <c:if test="${not empty replyBoardDto}">
        <input type="hidden" name="regroup" value="${replyBoardDto.regroup}">
        <input type="hidden" name="relevel" value="${replyBoardDto.relevel}">
        <input type="hidden" name="restep" value="${replyBoardDto.restep}">
    </c:if>


    <div class="d-flex justify-content-center my-5">
        <button class="btn btn-primary">WRITE</button>
        <button class="btn btn-secondary mx-2" type="reset">RESET</button>
    </div>
</form>
<script>
    const {
        ClassicEditor,
        Autoformat,
        AutoImage,
        Autosave,
        BlockQuote,
        Bold,
        CKBox,
        CKBoxImageEdit,
        CloudServices,
        Essentials,
        Heading,
        ImageBlock,
        ImageCaption,
        ImageInline,
        ImageInsert,
        ImageInsertViaUrl,
        ImageResize,
        ImageStyle,
        ImageTextAlternative,
        ImageToolbar,
        ImageUpload,
        Indent,
        IndentBlock,
        Italic,
        Link,
        LinkImage,
        List,
        ListProperties,
        MediaEmbed,
        Paragraph,
        PasteFromOffice,
        PictureEditing,
        Table,
        TableCaption,
        TableCellProperties,
        TableColumnResize,
        TableProperties,
        TableToolbar,
        TextTransformation,
        TodoList,
        Underline
    } = window.CKEDITOR;

    const LICENSE_KEY =
        'eyJhbGciOiJFUzI1NiJ9.eyJleHAiOjE3MzQ2NTI3OTksImp0aSI6ImUzYmYyOTcxLTI5MWYtNDI2OS05OTM1LWVhY2RiNzYwM2I5MyIsInVzYWdlRW5kcG9pbnQiOiJodHRwczovL3Byb3h5LWV2ZW50LmNrZWRpdG9yLmNvbSIsImRpc3RyaWJ1dGlvbkNoYW5uZWwiOlsiY2xvdWQiLCJkcnVwYWwiLCJzaCJdLCJ3aGl0ZUxhYmVsIjp0cnVlLCJsaWNlbnNlVHlwZSI6InRyaWFsIiwiZmVhdHVyZXMiOlsiKiJdLCJ2YyI6IjUxMjk5YmU0In0.uKaQTt_8cKsndMG7PEajhTa6euTibOz8xObJpWu9Y9dEtDb7KivwO9GmGGuuCkue-2FOo7t_Bv3rKMhNXYuhUg';

    const CLOUD_SERVICES_TOKEN_URL =
        'https://gk7py3ht9lob.cke-cs.com/token/dev/a6f94ceda1b5e494ce487fd718c7adc0f595ce33c3fc7c7acd8b6f5aa334?limit=10';

    const editorConfig = {
        toolbar: {
            items: [
                'heading',
                '|',
                'bold',
                'italic',
                'underline',
                '|',
                'link',
                'insertImage',
                'ckbox',
                'mediaEmbed',
                'insertTable',
                'blockQuote',
                '|',
                'bulletedList',
                'numberedList',
                'todoList',
                'outdent',
                'indent'

            ],
            shouldNotGroupWhenFull: false
        },
        plugins: [
            Autoformat,
            AutoImage,
            Autosave,
            BlockQuote,
            Bold,
            CKBox,
            CKBoxImageEdit,
            CloudServices,
            Essentials,
            Heading,
            ImageBlock,
            ImageCaption,
            ImageInline,
            ImageInsert,
            ImageInsertViaUrl,
            ImageResize,
            ImageStyle,
            ImageTextAlternative,
            ImageToolbar,
            ImageUpload,
            Indent,
            IndentBlock,
            Italic,
            Link,
            LinkImage,
            List,
            ListProperties,
            MediaEmbed,
            Paragraph,
            PasteFromOffice,
            PictureEditing,
            Table,
            TableCaption,
            TableCellProperties,
            TableColumnResize,
            TableProperties,
            TableToolbar,
            TextTransformation,
            TodoList,
            Underline
        ],
        mediaEmbed: {
            previewsInData: true
        },
        //ajax처리할때 이미지 처리해주는 servlet
        ckfinder: {
            uploadUrl: "../board/upload"
        },
        cloudServices: {
            tokenUrl: CLOUD_SERVICES_TOKEN_URL
        },
        heading: {
            options: [
                {
                    model: 'paragraph',
                    title: 'Paragraph',
                    class: 'ck-heading_paragraph'
                },
                {
                    model: 'heading1',
                    view: 'h1',
                    title: 'Heading 1',
                    class: 'ck-heading_heading1'
                },
                {
                    model: 'heading2',
                    view: 'h2',
                    title: 'Heading 2',
                    class: 'ck-heading_heading2'
                },
                {
                    model: 'heading3',
                    view: 'h3',
                    title: 'Heading 3',
                    class: 'ck-heading_heading3'
                },
                {
                    model: 'heading4',
                    view: 'h4',
                    title: 'Heading 4',
                    class: 'ck-heading_heading4'
                },
                {
                    model: 'heading5',
                    view: 'h5',
                    title: 'Heading 5',
                    class: 'ck-heading_heading5'
                },
                {
                    model: 'heading6',
                    view: 'h6',
                    title: 'Heading 6',
                    class: 'ck-heading_heading6'
                }
            ]
        },
        image: {
            toolbar: [
                'toggleImageCaption',
                'imageTextAlternative',
                '|',
                'imageStyle:inline',
                'imageStyle:wrapText',
                'imageStyle:breakText',
                '|',
                'resizeImage',
                '|',
                'ckboxImageEdit',
                'ckfinder'
            ]
        },
        initialData: "",
        licenseKey: LICENSE_KEY,
        link: {
            addTargetToExternalLinks: true,
            defaultProtocol: 'https://',
            decorators: {
                toggleDownloadable: {
                    mode: 'manual',
                    label: 'Downloadable',
                    attributes: {
                        download: 'file'
                    }
                }
            }
        },
        list: {
            properties: {
                styles: true,
                startIndex: true,
                reversed: true
            }
        },
        placeholder: 'Type or paste your content here!',
        table: {
            contentToolbar: ['tableColumn', 'tableRow', 'mergeTableCells', 'tableProperties', 'tableCellProperties']
        }
    };

    configUpdateAlert(editorConfig);

    ClassicEditor.create(document.querySelector('#content'), editorConfig)
        .then( editor => {
            //form 데이터를 클릭했을때 넘어갈 데이터를 설정합니다.
            window.editor = editor;
            console.log('CKEditor 전송 정보 : ' + editor);
        })
        .catch(err => {
            console.log('발생 오류 : '+err);
        });


    /**
     * This function exists to remind you to update the config needed for premium features.
     * The function can be safely removed. Make sure to also remove call to this function when doing so.
     */
    function configUpdateAlert(config) {
        if (configUpdateAlert.configUpdateAlertShown) {
            return;
        }

        const isModifiedByUser = (currentValue, forbiddenValue) => {
            if (currentValue === forbiddenValue) {
                return false;
            }

            if (currentValue === undefined) {
                return false;
            }

            return true;
        };

        const valuesToUpdate = [];

        configUpdateAlert.configUpdateAlertShown = true;

        if (!isModifiedByUser(config.cloudServices?.tokenUrl, '<YOUR_CLOUD_SERVICES_TOKEN_URL>')) {
            valuesToUpdate.push('CLOUD_SERVICES_TOKEN_URL');
        }

        if (valuesToUpdate.length) {
            window.alert(
                [
                    'Please update the following values in your editor config',
                    'to receive full access to Premium Features:',
                    '',
                    ...valuesToUpdate.map(value => ` - ${value}`)
                ].join('\n')
            );
        }
    }

</script>

<%@ include file="../include/footer.jsp" %>