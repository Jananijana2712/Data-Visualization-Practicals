package com.example.chartvisualizer;

import org.apache.commons.csv.CSVFormat;
import org.apache.commons.csv.CSVParser;
import org.apache.commons.csv.CSVRecord;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@Controller
public class ChartController {

    private List<Map<String, String>> previewData;

    @GetMapping("/")
    public String index() {
        return "index";
    }

    @PostMapping("/upload")
    public String uploadFile(MultipartFile file, Model model) throws IOException {
        try (CSVParser parser = new CSVParser(new InputStreamReader(file.getInputStream()), CSVFormat.DEFAULT.withFirstRecordAsHeader())) {
            previewData = new ArrayList<>();
            for (CSVRecord record : parser) {
                Map<String, String> row = new LinkedHashMap<>();
                record.toMap().forEach(row::put);
                previewData.add(row);
            }
        }
        model.addAttribute("previewData", previewData);
        return "index";
    }

    @GetMapping("/api/chart/bar")
    @ResponseBody
    public ChartData getBarChartData() {
        return generateChartData();
    }

    @GetMapping("/api/chart/line")
    @ResponseBody
    public ChartData getLineChartData() {
        return generateChartData();
    }

    @GetMapping("/api/chart/scatter")
    @ResponseBody
    public ChartData getScatterChartData() {
        return generateChartData();
    }

    @GetMapping("/api/chart/boxplot")
    @ResponseBody
    public ChartData getBoxPlotData() {
        return generateChartData();
    }

    private ChartData generateChartData() {
        ChartData chartData = new ChartData();
        List<String> labels = new ArrayList<>();
        List<Double> values = new ArrayList<>();
        
        if (previewData != null && !previewData.isEmpty()) {
            for (Map.Entry<String, String> entry : previewData.get(0).entrySet()) {
                labels.add(entry.getKey());
                values.add(Double.valueOf(entry.getValue()));
            }
        }
        
        chartData.setLabels(labels);
        chartData.setValues(values);
        return chartData;
    }
}
