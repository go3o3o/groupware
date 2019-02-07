package service;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

public class DownloadFile extends AbstractView {
	private File file;

	public DownloadFile(File file) {
		// applicationContext를 UTF-8로 읽어드림
		// download 할 파일 정보도 UTF-8로 읽어드림
		// setContentType("applicationContext/download; UTF-8");
		this.file = file;
	}

	protected void renderMergedOutputModel(Map<String, Object> arg0, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		// response.setContentType(getContentType());
		response.setContentLength((int) file.length());

		String userAgent = request.getHeader("User-Agent");
		boolean isIe = userAgent.indexOf("MSIE") > -1; // Internet Explorer
		String fileName = null;

		if (isIe) {
			fileName = URLEncoder.encode(file.getName(), "UTF-8");
		} else {
			fileName = new String(file.getName().getBytes("UTF-8"));
		}

		response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\";");
		response.setHeader("Content-Transfer-Encoding", "binary");
		OutputStream out = response.getOutputStream();
		FileInputStream fis = null;

		try {
			fis = new FileInputStream(file);
			FileCopyUtils.copy(fis, out);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (fis != null)
					fis.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		out.flush();
	}

}
