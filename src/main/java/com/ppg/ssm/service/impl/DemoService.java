package com.ppg.ssm.service.impl;

import com.sun.scenario.effect.impl.sw.sse.SSEBlend_SRC_OUTPeer;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.document.StringField;
import org.apache.lucene.document.TextField;
import org.apache.lucene.index.*;
import org.apache.lucene.queryparser.classic.ParseException;
import org.apache.lucene.queryparser.classic.QueryParser;
import org.apache.lucene.search.*;
import org.apache.lucene.store.FSDirectory;
import org.apache.lucene.util.Version;
import org.wltea.analyzer.lucene.IKAnalyzer;

import java.io.File;
import java.io.IOException;

public class DemoService {
    public static void main(String[] args) throws IOException, ParseException {
//        addDocument("5","ppg","江西萍乡");
//        addDocument("6","ghh","浙江杭州");
//        addDocument("7","hhj","江西吉安");
//        addDocument("8","jkk","江苏苏州");
//        getDocument("浙江");




    }

    public static void addDocument(String id,String name,String address) throws IOException {

        Document document = new Document();
        document.add(new StringField("id",id, Field.Store.YES));
        document.add(new TextField("name",name, Field.Store.YES));
        document.add(new TextField("address",address, Field.Store.YES));

        FSDirectory directory = FSDirectory.open(new File("E:\\lucene"));
        IKAnalyzer ikAnalyzer = new IKAnalyzer();
        IndexWriterConfig writerConfig = new IndexWriterConfig(Version.LATEST, ikAnalyzer);
        IndexWriter indexWriter = new IndexWriter(directory, writerConfig);
        indexWriter.addDocument(document);
        indexWriter.commit();
        indexWriter.close();
    }

    public static void getDocument(String address) throws IOException, ParseException {
        FSDirectory directory = FSDirectory.open(new File("E:\\lucene"));
        IKAnalyzer ikAnalyzer = new IKAnalyzer();
        IndexReader indexReader = DirectoryReader.open(directory);
        IndexSearcher indexSearcher = new IndexSearcher(indexReader);

        QueryParser queryParser = new QueryParser("address", ikAnalyzer);
        Query query = queryParser.parse(address);

        TermQuery termQuery = new TermQuery(new Term("address", address));

        TopDocs topDocs = indexSearcher.search(termQuery, 5);
        ScoreDoc[] scoreDocs = topDocs.scoreDocs;
        System.out.println("hit总数："+topDocs.totalHits);
        for (ScoreDoc scoreDoc : scoreDocs) {
            int doc = scoreDoc.doc;
            Document document = indexReader.document(doc);
            System.out.println("id:"+document.get("id"));
            System.out.println("name:"+document.get("name"));
            System.out.println("address:"+document.get("address"));
        }
    }
}
