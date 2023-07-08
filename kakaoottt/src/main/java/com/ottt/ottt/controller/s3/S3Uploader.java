package com.ottt.ottt.controller.s3;

import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.model.*;

import lombok.RequiredArgsConstructor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.server.ResponseStatusException;

import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

@RequiredArgsConstructor
@Service
public class S3Uploader {
	
    @Value("${cloud.aws.s3.bucket}")
    private String bucket;
    
    @Value("${cloud.aws.s3.bucket.url}")
    private String bucketUrl;
    
    @Autowired
    private AmazonS3 amazonS3;


    public String upload(MultipartFile multipartFile, String index) throws Exception {
    	
        String s3FileName = createFileName(multipartFile.getOriginalFilename(), index);
        System.out.println("s3FileName : " + s3FileName);        
        
        ObjectMetadata objectMetadata = new ObjectMetadata();
        objectMetadata.setContentLength(multipartFile.getSize());
        objectMetadata.setContentType(multipartFile.getContentType());

        try (InputStream inputStream =multipartFile.getInputStream()){
        	amazonS3.putObject(new PutObjectRequest(bucket, s3FileName, inputStream, objectMetadata)
            				.withCannedAcl(CannedAccessControlList.PublicRead));            
            
        } catch (IOException e) {
            throw new ResponseStatusException(HttpStatus.INTERNAL_SERVER_ERROR,"업로드 실패");
        }

        return s3FileName;
    }

    public String createFileName(String fileName, String index){
        return index + "/" + UUID.randomUUID().toString().concat(getFileExtension(fileName));
    }


//여기서 업로드 되는 파일 종류 제한
    public String getFileExtension(String fileName) {
        return fileName.substring(fileName.lastIndexOf("."));
    }

    public void deleteFile(String fileName) {
//        amazonS3.doesObjectExist()
    	fileName = fileName.replace(bucketUrl, "");
        amazonS3.deleteObject(bucket, fileName);
    }
}
